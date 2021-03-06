package net.overmy.bladeoflight.resources;

import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.AssetLoader;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.resolvers.InternalFileHandleResolver;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.freetype.FreeTypeFontGenerator;
import com.badlogic.gdx.graphics.g2d.freetype.FreeTypeFontGeneratorLoader;
import com.badlogic.gdx.graphics.g2d.freetype.FreetypeFontLoader;


/*
     Created by Andrey Mikheev on 20.04.2017
     Contact me → http://vk.com/id17317
 */


public final class Assets {

    private static AssetManager manager = null;


    private Assets () {
    }


    public static void init () {
        final FileHandleResolver resolver = new InternalFileHandleResolver();
        final AssetLoader fontsGenerator = new FreeTypeFontGeneratorLoader( resolver );
        final AssetLoader fontsLoader = new FreetypeFontLoader( resolver );

        manager = new AssetManager();
        manager.setLoader( FreeTypeFontGenerator.class, fontsGenerator );
        manager.setLoader( BitmapFont.class, ".ttf", fontsLoader );
    }


    public static void setManagerLogLevel ( int LOG_LEVEL ) {
        manager.getLogger().setLevel( LOG_LEVEL );
    }


    public static void load () {
        TextAsset.init();
        DialogAsset.init();

        FontAsset.load( manager );
        MusicAsset.load( manager );
        SoundAsset.load( manager );
        IMG.load( manager );

        ModelAsset.setManager( manager );

        ModelAsset.MY_PLAYER.load();
        ModelAsset.SWORD.load();
    }


    public static void build () {
        FontAsset.build( manager );
        MusicAsset.build( manager );
        SoundAsset.build( manager );
        IMG.build( manager );

        ModelAsset.MY_PLAYER.build();
        ModelAsset.SWORD.build();
    }


    public static void unload () {
        FontAsset.unload( manager );
        MusicAsset.unload( manager );
        SoundAsset.unload( manager );
        IMG.unload( manager );


        ModelAsset.unloadAll();

        manager.finishLoading();
        manager.dispose();

        Settings.save();

        ModelAsset.MY_PLAYER.unload();
        ModelAsset.SWORD.unload();

    }


    public static AssetManager getManager () {
        return manager;
    }
}
