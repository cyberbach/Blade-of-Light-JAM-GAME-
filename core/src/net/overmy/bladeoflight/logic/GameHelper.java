package net.overmy.bladeoflight.logic;

import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.physics.bullet.collision.btCollisionObject;
import com.badlogic.gdx.physics.bullet.dynamics.btRigidBody;

import net.overmy.bladeoflight.BulletWorld;
import net.overmy.bladeoflight.PhysicalBuilder;


/*
        Created by Andrey Mikheev on 20.04.2018
        Contact me → http://vk.com/id17317
*/
public class GameHelper {



    public int[] toInts ( String str ) {
        if ( "".equals( str ) ) {
            return null;
        }
        String[] separated = str.replaceAll( " ", "" ).split( "," );
        final int[] result = new int[ separated.length ];
        for ( int p = 0; p < separated.length; p++ ) {
            result[ p ] = Integer.parseInt( separated[ p ] );
        }
        return result;
    }


    public btRigidBody createCameraBody () {
        Vector3 cameraBodyOffset = new Vector3( 0, 1.7f, 5.0f );

        PhysicalBuilder physicalBuilder = new PhysicalBuilder()
                .defaultMotionState()
                .setMass( 0.01f )
                .setPosition( cameraBodyOffset )
                .capsuleShape( 1.2f, 0.0f )
                .setCollisionFlag( btCollisionObject.CollisionFlags.CF_CUSTOM_MATERIAL_CALLBACK )
                .setCallbackFlag( BulletWorld.CAMERA_FLAG )
                .setCallbackFilter( BulletWorld.GROUND_FLAG )
                .build();

        btRigidBody body = physicalBuilder.getSavedBody();
        body.setFriction( 0.0f );

        BulletWorld.addBody( body );
        return body;
    }
}
