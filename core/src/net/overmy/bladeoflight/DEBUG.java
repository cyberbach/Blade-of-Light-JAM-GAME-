package net.overmy.bladeoflight;

/*
     Created by Andrey Mikheev on 20.04.2017
     Contact me → http://vk.com/id17317
 */

public enum DEBUG {
    ENABLE_ENGLISH_TEXT( false ),
    SETTINGS( false ),
    STAGE( false ),
    DECAL_ENTITIES( false ),
    SHOW_MODEL_INFO( false ),
    NPC_ACTIONS( false ),

    FPS( false ),
    SCREEN_FPS( false ), // должен быть включен FPS

    ON_WINDOWS( false ),

    CONTACTS( false ),
    ENTITIES( false ),
    PHYSICAL_MESH( false ),
    DYNAMIC_LEVELS( false ),
    GAME_MASTER_MODE( false ),
    ;


    public static boolean anything () {
        for ( DEBUG d : DEBUG.values() ) {
            if ( d.get() ) {
                return true;
            }
        }
        return false;
    }


    private final boolean value;


    public boolean get () {
        return value;
    }


    DEBUG ( boolean value ) {
        this.value = value;
    }
}
