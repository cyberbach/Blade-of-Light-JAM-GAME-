package net.overmy.bladeoflight.logic;

/*
        Created by Andrey Mikheev on 02.03.2018
        Contact me → http://vk.com/id17317
*/

import com.badlogic.ashley.utils.ImmutableArray;
import net.overmy.bladeoflight.logic.NPCAction.*;
import net.overmy.bladeoflight.resources.TextAsset;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.utils.Array;


/** Билдер скриптов */
public final class ScriptBuilder {
    private ScriptBuilder () {
    }


    public static ImmutableArray< NPCAction > MONSTER1_MOVE_ON_LEVEL1 () {
        Array< NPCAction > queue = new Array< NPCAction >();

        queue.add( wait( 1.0f ) );
        queue.add( hunt() );
        queue.add( move(12.729724f, -26.19313f) );
        queue.add( wait( 1.0f ) );
        queue.add( hunt() );
        queue.add( move(-0.5718983f, -15.974129f) );
        queue.add( wait( 1.0f ) );
        queue.add( hunt() );
        queue.add( move(-3.3788373f, -20.052458f) );
        queue.add( hunt() );
        return new ImmutableArray< NPCAction >( queue );
    }

    public static ImmutableArray< NPCAction > DRAKON1_MOVE_ON_LEVEL4 () {
        Array< NPCAction > queue = new Array< NPCAction >();

        queue.add( wait( 1.0f ) );
        queue.add( hunt() );
        queue.add( move(-32.800106f, -73.38079f) );
        queue.add( wait( 1.0f ) );
        queue.add( hunt() );
        queue.add( move(-39.30264f, -80.23786f ) );
        queue.add( wait( 1.0f ) );
        queue.add( hunt() );
        queue.add( move(-47.024467f, -77.53844f) );
        queue.add( hunt() );
        return new ImmutableArray< NPCAction >( queue );
    }


    private static NPCAction wait ( float time ) {
        return new NPCAction( ACTION_ID.WAIT, time );
    }


    private static NPCAction hunt () {
        return new NPCAction( ACTION_ID.HUNT, 5.0f );
    }


    private static NPCAction move ( float x, float y ) {
        return new NPCAction( ACTION_ID.MOVE, new Vector2( x, y ), 10.0f );
    }


    private static NPCAction say ( TextAsset text, float time ) {
        return new NPCAction( ACTION_ID.SAY, text, time );
    }


    private static NPCAction animate ( int ID, float time ) {
        return new NPCAction( ACTION_ID.ANIMATE, time, ID );
    }
}
