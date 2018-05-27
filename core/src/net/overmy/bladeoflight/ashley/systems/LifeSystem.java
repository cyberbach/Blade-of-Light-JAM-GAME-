package net.overmy.bladeoflight.ashley.systems;

import com.badlogic.ashley.core.Entity;
import com.badlogic.ashley.core.Family;
import com.badlogic.ashley.systems.IteratingSystem;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.PerspectiveCamera;
import com.badlogic.gdx.graphics.g3d.decals.Decal;
import com.badlogic.gdx.graphics.g3d.decals.DecalBatch;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;

import net.overmy.bladeoflight.Core;
import net.overmy.bladeoflight.MyCamera;
import net.overmy.bladeoflight.MyRender;
import net.overmy.bladeoflight.ashley.EntityBuilder;
import net.overmy.bladeoflight.ashley.MyMapper;
import net.overmy.bladeoflight.ashley.component.LifeComponent;
import net.overmy.bladeoflight.ashley.component.ModelComponent;
import net.overmy.bladeoflight.ashley.component.RemoveByTimeComponent;
import net.overmy.bladeoflight.ashley.component.TYPE_OF_ENTITY;
import net.overmy.bladeoflight.resources.GameColor;
import net.overmy.bladeoflight.resources.TextAsset;



/*
     Created by Andrey Mikheev on 20.04.2017
     Contact me → http://vk.com/id17317
 */

public class LifeSystem extends IteratingSystem {

    private final DecalBatch        decalBatch;
    private final PerspectiveCamera camera;

    private final Vector3 position           = new Vector3();
    private       Vector3 offsetToMyPosition = new Vector3();
    private       Vector3 myPosition = new Vector3();

    private int     counter  = 0;
    private boolean showMyHP = false;


    @SuppressWarnings( "unchecked" )
    public LifeSystem () {
        super( Family.all( LifeComponent.class, ModelComponent.class ).get() );

        this.decalBatch = MyRender.getDecalBatch();
        this.camera = MyCamera.get();
    }


    @Override
    public void update ( float deltaTime ) {
        counter = 0;
        super.update( deltaTime );
        showMyHP = counter > 0;
    }


    @Override
    protected void processEntity ( Entity entity, float delta ) {
        boolean myEntity = MyMapper.MY_PLAYER.has( entity );//entity.equals( MyPlayer.getEntity() );
        if(myEntity){
            MyMapper.MODEL.get( entity ).modelInstance.transform.getTranslation( myPosition );
        }

        if ( myEntity && !showMyHP ) {
            return;
        }


        MyMapper.MODEL.get( entity ).modelInstance.transform.getTranslation( position );
        offsetToMyPosition.set( myPosition );
        offsetToMyPosition.sub( position );

        boolean showHP = offsetToMyPosition.len() < 12.0f;

        LifeComponent lifeComponent = MyMapper.LIFE.get( entity );

        position.add( 0, lifeComponent.heightOffset, 0 );

        Decal decal = lifeComponent.decal;

        if ( lifeComponent.life > 0.0f ) {
            if ( showHP ) {
                float width = lifeComponent.width * lifeComponent.getLifePercent();
                decal.setWidth( width );
                decal.setPosition( position );
                decal.lookAt( camera.position, camera.up );
                decalBatch.add( decal );

                if ( MyMapper.NPC.has( entity ) && !myEntity ) {
                    counter++;
                }
            }
        } else {
            Matrix4 transform = MyMapper.PHYSICAL.get( entity ).body.getWorldTransform();
            transform.getTranslation( position );

            TYPE_OF_ENTITY typeOfEntity = MyMapper.TYPE.get( entity ).type;
/*

            if ( TYPE_OF_ENTITY.DESTROYABLE_BOX.equals( typeOfEntity ) ) {
                AshleySubs.createCrateParts( position );

                if ( MyMapper.CONTAINER.has( entity ) ) {
                    AshleySubs.createGift( position, MyMapper.CONTAINER.get( entity ).item );
                }
            }

            if ( TYPE_OF_ENTITY.DESTROYABLE_ROCK.equals( typeOfEntity ) ) {
                AshleySubs.createRockParts( position );
            }
*/

            // === Здесь ENTITY умирает ===
            // Это чтобы компонент не пересоздавался при смене локаций
            if ( MyMapper.LEVEL_OBJECT.has( entity ) ) {
                TYPE_OF_ENTITY type = MyMapper.TYPE.get( entity ).type;
                if ( type.equals( TYPE_OF_ENTITY.NPC ) ) {
                    if ( !MyMapper.NPC.get( entity ).die ) {
                        MyMapper.NPC.get( entity ).die = true;
                        entity.add( new RemoveByTimeComponent( 1.0f ) );

                        /*Item itemForDrop = MyMapper.NPC.get( entity ).dropItem;
                        if ( itemForDrop != null ) {
                            AshleySubs.createPickable( position, itemForDrop );
                        }*/
                    }
                } else {
                    MyMapper.LEVEL_OBJECT.get( entity ).gameObject.use();
                }
            } else {

                if ( TYPE_OF_ENTITY.MYPLAYER.equals( typeOfEntity ) ) {
                    //MyPlayer.live = false;
                    Core.playerDie = true;
                    EntityBuilder.createText( TextAsset.DIE.get() );


                    MyMapper.ANIMATION.get( entity ).queue( 5, 0.5f );

                    entity.remove( LifeComponent.class );
                    MyCamera.block();
                    //MyCamera.removeConnectionBody();
                    Gdx.app.debug( "camera blocked","player die in life system" );

                }else {
                    entity.add( new RemoveByTimeComponent( 0 ) );
                }
            }
        }
    }
}
