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


    public final Vector3[] startPositions = new Vector3[] {
            new Vector3( -8.883699f, 3.3939111f, 5.062443f ),
            new Vector3( -46.313328f, 3.857123f, -54.17792f ),
            new Vector3( 0.59057057f, 2.7008367f, -149.63187f ),
            new Vector3( -85.78828f, 0.69114524f, -168.87808f ),
            new Vector3( -136.69661f, 2.7439363f, -362.21973f ),
            new Vector3( -245.94257f, 1.0721123f, -401.8604f ),
            new Vector3( -45.45584f, 3.2740111f, -442.94907f ),
            new Vector3( -122.323654f, 1.9100869f, -439.41284f ),
            new Vector3( -191.47537f, 6.3835006f, -473.49835f ), // 08
            new Vector3( -101.14407f, 3.693308f, -473.77426f ),
            new Vector3( -20.104654f, 8.933582f, -457.48343f ),//10
            new Vector3( -116.753716f, 2.1432183f, -535.78394f ),
            new Vector3( -59.840767f, 4.429752f, -620.98224f ),//12 с камнями
            new Vector3( -26.71163f, 2.1870565f, -656.59534f ),// с мостом
            new Vector3( -3.0696986f, -12.057977f, -620.8561f ),//труба
            new Vector3( -222.9113f, 13.589132f, -601.74225f ),//15 - продолжение 8-го
            new Vector3( 4.819017f, 5.0487814f, -753.78217f ),//зимняя
            new Vector3( -7.4517694f, 6.3198724f, -832.11035f ),//зимняя 17
            new Vector3( -43.897774f, 1.6834409f, -820.6343f ),//18 кривая к боссу
            new Vector3( -82.29632f, 2.3234348f, -834.7413f ),// 19 last boss
            new Vector3( 42.987503f, 6.59883f, -845.1438f ),
            new Vector3( 151.79369f, 9.256329f, -862.6666f ),
            new Vector3( 124.73992f, 3.3195992f, -766.70984f ),
            new Vector3( 134.58124f, 5.1869044f, -712.3334f ),//23
            new Vector3( 64.61289f, 5.4833136f, -592.8458f ),
            new Vector3( 49.58613f, 3.6817787f, -483.6303f ),//25 замок
            new Vector3( 55.648212f, 3.6817815f, -424.52176f ),//26 придворки замка
            new Vector3( 104.72133f, 3.909871f, -401.69968f ),
            new Vector3( 114.18283f, 3.717038f, -359.78253f ),
            new Vector3( 146.52269f, 4.539406f, -292.49527f ), // 29
            new Vector3( 119.88079f, 5.6133566f, -232.79167f ),// last secret
            new Vector3( -145.61096f, 2.1391315f, -859.0328f )// 31 - last one
    };


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
