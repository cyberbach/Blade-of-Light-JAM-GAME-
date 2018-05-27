package net.overmy.bladeoflight.ashley.systems;

import com.badlogic.ashley.core.Engine;
import com.badlogic.ashley.core.Entity;
import com.badlogic.ashley.core.Family;
import com.badlogic.ashley.systems.IteratingSystem;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.physics.bullet.dynamics.btRigidBody;

import net.overmy.bladeoflight.Core;
import net.overmy.bladeoflight.MyCamera;
import net.overmy.bladeoflight.ashley.MyMapper;
import net.overmy.bladeoflight.ashley.component.MyPlayerComponent;
import net.overmy.bladeoflight.resources.MusicAsset;
import net.overmy.bladeoflight.resources.SoundAsset;


/*
     Created by Andrey Mikheev on 22.04.2017
     Contact me → http://vk.com/id17317
 */

public class MyPlayerSystem extends IteratingSystem {


    private final Vector2 direction      = new Vector2();
    private final Vector3 velocity       = new Vector3();
    private       Matrix4 bodyTransform  = new Matrix4();
    private final Vector3 notFilteredPos = new Vector3();
    private       float   modelAngle     = 0.0f;

    private boolean attack2 = false;
    private boolean attack  = false;
    private boolean block   = false;

    private Vector2 originalDirection = new Vector2(  );
    private Quaternion rotation = new Quaternion();




    @SuppressWarnings( "unchecked" )
    public MyPlayerSystem () {
        super( Family.all( MyPlayerComponent.class ).get() );
    }


    public void playWalkSounds () {
        SoundAsset.PLAYER_STEP.play();
        SoundAsset.PLAYER_STEP.playLoop();
        SoundAsset.PLAYER_STEP.setThisVolume( 0 );
    }


    @Override
    protected void processEntity ( Entity entity, float delta ) {
        if(block)return;

        if( Core.playerDie)return;

        btRigidBody playerBody = MyMapper.PHYSICAL.get( entity ).body;

        // Двигаем или останавливаем физическое тело
        velocity.set( direction.x, 0, direction.y );
        velocity.add( 0, playerBody.getLinearVelocity().y, 0 );

        playerBody.getWorldTransform( bodyTransform );
        bodyTransform.getTranslation( notFilteredPos );

        if ( direction.len() != 0 ) {
            SoundAsset.PLAYER_STEP.setThisVolume( 1 );
            bodyTransform.idt();
            bodyTransform.setToTranslation( notFilteredPos );
            bodyTransform.rotate( Vector3.Y, modelAngle );
            playerBody.proceedToTransform( bodyTransform );

            if(!attack) {
                if ( originalDirection.len() > 0.5f ) {
                    MyMapper.ANIMATION.get( entity ).play( 2, 3.0f );
                    MyMapper.ANIMATION.get( entity ).queue( 2, 3.0f );
                } else {
                    MyMapper.ANIMATION.get( entity ).play( 1, 2.0f );
                    MyMapper.ANIMATION.get( entity ).queue( 1, 2.0f );
                }
            }
        }else{
            SoundAsset.PLAYER_STEP.setThisVolume( 0 );
        }

        if(attack) {
            MyMapper.ANIMATION.get( entity ).play( 3, 2.0f );
            attack=false;
            SoundAsset.SWORD.play();

        }

        if(attack2) {
            MyMapper.ANIMATION.get( entity ).play( 4, 2.0f );
            attack2=false;
            SoundAsset.SWORD.play();
        }

        playerBody.setLinearVelocity( velocity );
/*
        if ( attack2 ) {
            attack2 = false;
            playerBody.applyCentralImpulse( new Vector3( 0, 800, 0 ) );
            MyMapper.ANIMATION.get( entity ).play( 2, 1.0f );
        }*/

        //MyCamera.setCameraPosition( notFilteredPos );

        if ( direction.len() == 0 )
        MyMapper.ANIMATION.get( entity ).queue( 0,2.0f );
    }


    public void move ( float x, float y ) {
        direction.set( x, y );


        originalDirection.set( direction );

        float myspeed = direction.len() * 10;

        direction.nor();



        direction.rotate( -MyCamera.getCameraAngle() );
        direction.scl( myspeed );

        // Сохраняем угол для поворота модели
        modelAngle = 90 - direction.angle();
    }


    public Vector3 getNotFilteredPos () {
        return notFilteredPos;
    }


    public float getAngle () {
        bodyTransform.getRotation( rotation );
        return rotation.getAxisAngle( Vector3.Y );
    }


    public void startAttack2 () {
        attack2 = true;
    }


    public void startAttack () {
        attack = true;
    }


    @Override
    public void removedFromEngine ( Engine engine ) {
        super.removedFromEngine( engine );

        SoundAsset.PLAYER_STEP.stop();
    }


    public void block () {
        block = true;
    }

    public void unblock () {
        block = false;
    }
}
