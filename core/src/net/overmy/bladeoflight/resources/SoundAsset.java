package net.overmy.bladeoflight.resources;

import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.audio.Sound;

/*
     Created by Andrey Mikheev on 29.09.2017
     Contact me → http://vk.com/id17317
 */

public enum SoundAsset {
    A1("a1"),
    A2("a2"),
    A3("a3"),
    A4("a4"),
    A5("a5"),

    CLICK("click"),
    SWORD("sword"),

    PLAYER_HIT_NPC1("plhit1"),
    PLAYER_HIT_NPC2("plhit2"),
    PLAYER_HIT_NPC3("plhit3"),

    PLAYER_DAMAGE("damage"),
    PLAYER_STEP("step1"),
    NPC_STEP("step2"),
    ;

    private final String path;
    private        Sound snd    = null;
    private        long  id     = 0;
    private static float volume = 0.0f;


    public static void setVolume ( float fvolume ) {
        volume = fvolume;
    }


    public void setThisVolume ( float newVolume ) {
        this.snd.setVolume( id, volume * newVolume );
    }


    SoundAsset ( final String path ) {
        String DEFAULT_DIR = "sound/";
        String DEFAULT_EXT = ".ogg";
        this.path = DEFAULT_DIR + path+DEFAULT_EXT;
    }

/*
    public static void stopAll () {
        for ( int i = 0; i < SoundAsset.values().length; i++ ) {
            SoundAsset.values()[ i ].snd.stop();
        }
    }
*/


    public static void build ( final AssetManager manager ) {
        for ( int i = 0; i < SoundAsset.values().length; i++ ) {
            SoundAsset.values()[ i ].snd = manager.get( SoundAsset.values()[ i ].path,
                                                        Sound.class );
        }
    }


    public static void load ( final AssetManager manager ) {
        for ( int i = 0; i < SoundAsset.values().length; i++ ) {
            manager.load( SoundAsset.values()[ i ].path, Sound.class );
        }
    }


    public static void unload ( final AssetManager manager ) {
        for ( int i = 0; i < SoundAsset.values().length; i++ ) {

            if ( SoundAsset.values()[ i ].snd != null ) {
                SoundAsset.values()[ i ].snd.dispose();
                SoundAsset.values()[ i ].snd = null;

                manager.unload( SoundAsset.values()[ i ].path );
            }
        }
    }


    public void playLoop () {
        if ( volume >= 0.0f ) {
            id = this.snd.loop( volume, 1, 1 );
            //this.snd.setLooping( id, true );
            //this.snd.setVolume( id, soundVolume );
        }
    }


    public void play () {
        if ( volume >= 0.0f ) {
            id = this.snd.play();
            this.snd.setLooping( id, false );
            this.snd.setVolume( id, volume );
        }
    }


    public void stop () {
        if ( id != 0 ) {
            this.snd.stop();
        }
    }

    // HARDCODE!
    //public Music get() { return Gdx.audio.newMusic( Gdx.files.internal( this.path ) ); }


    public Sound get () {
        return this.snd;
    }


    public void setPitch ( float pitch ) {
        this.snd.setPitch( id, pitch );
    }
}
