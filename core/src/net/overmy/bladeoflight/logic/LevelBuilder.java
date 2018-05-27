package net.overmy.bladeoflight.logic;

/*
        Created by Andrey Mikheev on 21.03.2018
        Contact me → http://vk.com/id17317
*/

import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;

import net.overmy.bladeoflight.logic.collectables.Trigger;
import net.overmy.bladeoflight.logic.objects.GameObject;
import net.overmy.bladeoflight.logic.objects.NPCObject;
import net.overmy.bladeoflight.logic.objects.TriggerObject;
import net.overmy.bladeoflight.resources.ModelAsset;


class LevelBuilder {

    // Этот класс работает по принципу ENUM


    Array< GameObject > LEVEL0 () {
        Array< GameObject > objects = new Array< GameObject >();

        objects.add( new TriggerObject( Trigger.TRIGGER1,
                                        new Vector3(  -1.5443124f, -2.0000188f, -5.023402f ), 5 ) );

        return objects;
    }


    Array< GameObject > LEVEL1 () {
        Array< GameObject > objects = new Array< GameObject >();
//new Vector3( 29.17271f, 3.2932336f, -37.428074f )
        objects.add( new TriggerObject( Trigger.MY_TEST_TIRGGER,
                                        new Vector3( 11.330224f, 0.4019979f, -42.39821f ), 2 ) );

        objects.add( new NPCObject( new Vector3( 9.488587f, 3, -25.605047f ), ModelAsset.MONSTER1,
                                    ScriptBuilder.MONSTER1_MOVE_ON_LEVEL1()) );
        return objects;
    }


    public Array<GameObject> LEVEL4 () {
        /*
        new Vector3( -32.800106f, -2.0f, -73.38079f )
Current camera angle = 19.595982:

THIS LOCATION: 4
Pushed angle = 225.07423:
new Vector3( -39.30264f, -2.0005882f, -80.23786f )
Current camera angle = 19.595982:

THIS LOCATION: 4
Pushed angle = 68.225296:
new Vector3( -47.024467f, -2.0000005f, -77.53844f )
Current camera angle = 19.595982:
         */
        Array< GameObject > objects = new Array< GameObject >();

        objects.add( new NPCObject( new Vector3( -32.800106f, -1.0f, -73.38079f  ), ModelAsset.DRAKON1,
                                    ScriptBuilder.DRAKON1_MOVE_ON_LEVEL4()) );

        return objects;
    }
}
