package net.overmy.bladeoflight.logic;

import com.badlogic.ashley.utils.ImmutableArray;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.utils.Array;

import net.overmy.bladeoflight.DEBUG;
import net.overmy.bladeoflight.ashley.EntityBuilder;
import net.overmy.bladeoflight.ashley.component.RemoveByTimeComponent;
import net.overmy.bladeoflight.logic.objects.GameObject;
import net.overmy.bladeoflight.resources.Assets;
import net.overmy.bladeoflight.resources.ModelAsset;


/*
     Created by Andrey Mikheev on 20.04.2017
     Contact me → http://vk.com/id17317
 */

public final class DynamicLevels {

    private DynamicLevels () {
    }


    private static Array< Integer > currentConnections  = null;
    private static Array< Integer > previousConnections = null;

    private static ImmutableArray< Level > levels = null;

    private static int current;


    public static void initLevels () {
        Array< Level > levelArray = new Array< Level >();

        LevelBuilder objects = new LevelBuilder();

        // на выходе из этого метода GameHelper удалится из памяти
        GameHelper helper = new GameHelper();

        levelArray.add( new Level( helper.toInts( "0, 1" ), objects.LEVEL0() ) );
        levelArray.add( new Level( helper.toInts( "1, 2, 0, 3"), objects.LEVEL1()  ) );
        levelArray.add( new Level( helper.toInts( "2, 1, 4" ) ) );
        levelArray.add( new Level( helper.toInts( "3, 1, 4" ) ) );
        levelArray.add( new Level( helper.toInts( "4, 2, 3, 5" ), objects.LEVEL4() ) );
        levelArray.add( new Level( helper.toInts( "5, 4, 6" ) ) );
        levelArray.add( new Level( helper.toInts( "6, 5, 7" ) ) );
        levelArray.add( new Level( helper.toInts( "7, 6, 8" ) ) );
        levelArray.add( new Level( helper.toInts( "8, 7, 9" ) ) );
        levelArray.add( new Level( helper.toInts( "9, 8, 3,10" ) ) );
        levelArray.add( new Level( helper.toInts( "10, 9, 11" ) ) );
        levelArray.add( new Level( helper.toInts( "11, 10" ) ) );

        levels = new ImmutableArray< Level >( levelArray );
    }


    public static void init () {
        // FIXME
        current = 0;//Settings.START_LOCATION.getInteger();

        currentConnections = null;
        previousConnections = null;

        currentConnections = new Array< Integer >();
        previousConnections = new Array< Integer >();

        initLevels();
    }


    private static boolean unloaded = true;


    private static void removeNotMatchEntities () {
        for ( int p : previousConnections ) {
            if ( zoneNotInCurrentConnections( p ) ) {
                Level level = levels.get( p );

                if ( DEBUG.DYNAMIC_LEVELS.get() ) {
                    Gdx.app.debug( "remove level", "" + level );
                }

                if ( level.entity != null ) {
                    level.entity.add( new RemoveByTimeComponent( 0 ) );
                }
                level.entity = null;

                if ( level.objects != null ) {
                    if ( DEBUG.DYNAMIC_LEVELS.get() ) {
                        Gdx.app.debug( "objects in " + p, "" + level.objects.size() );
                    }
                    for ( GameObject object : level.objects ) {
                        object.removeEntity();
                    }
                }
            }
        }
    }


    private static void removeNotMatchModels () {
        for ( int p : previousConnections ) {
            //Gdx.app.debug( "try",""+p );
            if ( zoneNotInCurrentConnections( p ) ) {
                if ( DEBUG.DYNAMIC_LEVELS.get() ) {
                    Gdx.app.debug( "unload level", "" + ModelAsset.values()[ p ] );
                }
                ModelAsset.values()[ p ].unload();

                Level level = levels.get( p );
                if ( level.objects != null ) {
                    for ( GameObject object : level.objects ) {
                        ModelAsset assetOfObject = object.getModelAsset();
                        if ( !isModelInAnyCurrentConnections( assetOfObject ) ) {
                            if ( assetOfObject != null ) {
                                if ( loadingNotInDynamicLevels( assetOfObject ) ) {
                                    if ( DEBUG.DYNAMIC_LEVELS.get() ) {
                                        Gdx.app.debug( "unload object", "" + assetOfObject );
                                    }
                                    assetOfObject.unload();
                                }
                            }
                        }
                    }
                }
            }
        }
        unloaded = true;
    }


    private static boolean zoneNotInCurrentConnections ( int n ) {
        for ( int i : currentConnections ) {
            if ( n == i ) {
                return false;
            }
        }
        return true;
    }


    private static boolean isModelInAnyCurrentConnections ( ModelAsset models ) {
        for ( int i : currentConnections ) {
            Level level = levels.get( i );
            if ( level.objects != null ) {
                for ( GameObject object : level.objects ) {
                    ModelAsset assetOfObject = object.getModelAsset();
                    if ( assetOfObject == models ) {
                        if ( DEBUG.DYNAMIC_LEVELS.get() ) {
                            Gdx.app.debug( "" + models, "in current set" );
                        }
                        return true;
                    }
                }
            }
        }

        if ( DEBUG.DYNAMIC_LEVELS.get() ) {
            Gdx.app.debug( "" + models, "NOT in current set" );
        }
        return false;
    }


    private static void updateCurrentConnections () {
        if ( unloaded ) {
            unloaded = false;
            currentConnections.clear();

            Level level = levels.get( current );

            assert level.connections != null;
            for ( int i : level.connections ) {
                currentConnections.add( i );
            }

            if ( DEBUG.DYNAMIC_LEVELS.get() ) {
                Gdx.app.debug( "Current connections updated", "" + currentConnections );
            }
        }
    }


    private static void copyCurrentConnectionsToPrevious () {
        previousConnections.clear();
        previousConnections.addAll( currentConnections );
    }


    private static void loadNewModels () {
        if ( DEBUG.DYNAMIC_LEVELS.get() ) {
            Gdx.app.debug( "loadNewModels", "start" );
        }
        for ( int i : currentConnections ) {
            ModelAsset.values()[ i ].load();

            Level level = levels.get( i );
            if ( level.objects != null ) {
                // Загружаем объекты на уровне
                for ( GameObject object : level.objects ) {
                    ModelAsset assetOfObject = object.getModelAsset();
                    if ( assetOfObject != null ) {
                        if ( loadingNotInDynamicLevels( assetOfObject ) ) {
                            //Gdx.app.debug( "loadingNotInDynamicLevels", "assetOfObject = "+assetOfObject );
                            assetOfObject.load();
                        }
                    }
                }
            }
        }
    }


    private static void buildEntities () {
        if ( DEBUG.DYNAMIC_LEVELS.get() ) {
            Gdx.app.debug( "buildEntities", "start" );
        }
        for ( int i : currentConnections ) {
            Level level = levels.get( i );

            ModelAsset thisLevel = ModelAsset.values()[ i ];
            thisLevel.build();

            if ( level.entity == null ) {
                if ( DEBUG.DYNAMIC_LEVELS.get() ) {
                    Gdx.app.debug( "Need to build LEVEL", "" + thisLevel );
                }
                level.entity = EntityBuilder.createGround( thisLevel );
            }

            if ( level.objects != null ) {
                for ( GameObject object : level.objects ) {
                    ModelAsset assetOfObject = object.getModelAsset();
                    if ( assetOfObject != null ) {
                       if ( loadingNotInDynamicLevels( assetOfObject ) ) {
                            if ( object.getEntity() == null ) {
                                assetOfObject.build();
                            }
                        }
                    }

                    object.buildEntity();
                }
            }
        }
    }


    private static boolean loadingNotInDynamicLevels ( ModelAsset asset ) {
        /*
        boolean broom = ModelAsset.BROOM_WEAPON.equals( asset );
        boolean rake = ModelAsset.RAKE_WEAPON.equals( asset );
        boolean kalash = ModelAsset.KALASH_WEAPON.equals( asset );
        boolean fence = ModelAsset.FENCE_WEAPON.equals( asset );
        boolean pillow = ModelAsset.PILLOW_WEAPON.equals( asset );
        boolean gun = ModelAsset.GUN_WEAPON.equals( asset );
        return !( broom || rake || kalash || fence || pillow || gun );
        */
        return true;
    }


    private static boolean needToUpdate = false;
    private static boolean needToBuild  = false;

    private static final float MAX_UNLOAD_DELAY = 0.1f;

    private static float unloadDelay = MAX_UNLOAD_DELAY;


    public static void reload () {
        needToUpdate = true;
        needToBuild = true;
        unloadDelay = MAX_UNLOAD_DELAY;
        copyCurrentConnectionsToPrevious();
        updateCurrentConnections();
        removeNotMatchEntities();
        loadNewModels();
    }


    public static void update ( float delta ) {
        if ( needToUpdate ) {
            /*reloadDelay-=delta;
            if(reloadDelay<0) {
                reload ();
            }*/

            if ( Assets.getManager().update() ) {
                needToUpdate = false;
                if ( needToBuild ) {

                    if ( DEBUG.DYNAMIC_LEVELS.get() ) {
                        Gdx.app.debug( "Dynamic levels update", "needToBuild" );
                    }

                    // Добавляем нужные Entity, т.к. они уже загружены
                    buildEntities();
                    needToBuild = false;
                }
            }
        }

        if ( unloadDelay > 0 ) {
            unloadDelay -= delta;
            if ( unloadDelay <= 0 ) {

                if ( DEBUG.DYNAMIC_LEVELS.get() ) {
                    Gdx.app.debug( "unloadDelay", "tick (dynamic levels)" );
                }

                // Здесь ненужные модели добавляются в стэк удаления менеджера Assets
                removeNotMatchModels();
                needToUpdate = true;
            }
        }
    }


    public static int getCurrent () {
        return current;
    }


    public static void setCurrent ( int id ) {
        current = id;

        if ( DEBUG.DYNAMIC_LEVELS.get() ) {
            Gdx.app.debug( "Now current id", "" + current );
        }
    }


    public static void dispose () {
        // FIXME
        //Settings.START_LOCATION.setInteger( current );

        currentConnections = null;
        previousConnections = null;
        levels = null;
    }
}
