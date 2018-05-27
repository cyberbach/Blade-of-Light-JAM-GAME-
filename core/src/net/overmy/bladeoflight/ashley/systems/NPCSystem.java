package net.overmy.bladeoflight.ashley.systems;

import com.badlogic.ashley.core.Engine;
import com.badlogic.ashley.core.Entity;
import com.badlogic.ashley.core.Family;
import com.badlogic.ashley.systems.IteratingSystem;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.physics.bullet.dynamics.btRigidBody;

import net.overmy.bladeoflight.DEBUG;
import net.overmy.bladeoflight.ashley.MyMapper;
import net.overmy.bladeoflight.ashley.component.AnimationComponent;
import net.overmy.bladeoflight.ashley.component.NPCComponent;
import net.overmy.bladeoflight.ashley.component.SkipScriptComponent;
import net.overmy.bladeoflight.ashley.component.TextDecalComponent;
import net.overmy.bladeoflight.logic.NPCAction;
import net.overmy.bladeoflight.resources.ModelAsset;
import net.overmy.bladeoflight.resources.SoundAsset;


/*
     Created by Andrey Mikheev on 20.04.2017
     Contact me → http://vk.com/id17317
 */

public class NPCSystem extends IteratingSystem {

    // FIXME всё исправить

    private static Vector2 direction      = new Vector2();
    private static Vector3 velocity       = new Vector3();
    private static Matrix4 bodyTransform  = new Matrix4();
    private static Vector3 notFilteredPos = new Vector3();
    private static float   dustTime       = 0.1f;

    private float modelAngle = 0.0f;

    private Vector2 tmp = new Vector2();


    private Vector2 npcPosition = new Vector2();


    Vector3 temp3=new Vector3(  );
    public void setPlayerPosition ( Matrix4 playerTransform ) {
        playerTransform.getTranslation( temp3 );
        this.playerPosition.set( temp3.x, temp3.z );
    }


    private Vector2 playerPosition = new Vector2();


    @SuppressWarnings( "unchecked" )
    public NPCSystem () {
        super( Family.all( NPCComponent.class ).get() );
    }


    @Override
    protected void processEntity ( Entity entity, float delta ) {
        NPCComponent npcComponent = MyMapper.NPC.get( entity );

        int action = npcComponent.currentAction;

        boolean needToSkip = MyMapper.SKIP.has( entity );

        if ( !needToSkip ) {
            npcComponent.time -= delta;
        }

        NPCAction npcAction;

        if ( npcComponent.time < 0 ) {

            action++;
            if ( action > npcComponent.actionArray.size() - 1 ) {
                action = 0;
            }

            npcAction = npcComponent.actionArray.get( action );
            npcComponent.time = npcAction.durationTime;
            npcComponent.currentAction = action;

            if ( DEBUG.NPC_ACTIONS.get() ) {
                Gdx.app.debug( "action " + npcAction.id, "time " + npcComponent.time );
                if ( npcComponent.actionArray.get( action ).targetPosition != null ) {
                    Gdx.app.debug( "targetPosition", "" + npcAction.targetPosition );
                }
            }
        } else {
            npcAction = npcComponent.actionArray.get( action );
        }

        btRigidBody body = MyMapper.PHYSICAL.get( entity ).body;
        body.getWorldTransform( bodyTransform );
        bodyTransform.getTranslation( notFilteredPos );

        boolean attack = false;

        int forceAnimate = -1;

        if ( needToSkip ) {
            keepCalm();
        } else {
            switch ( npcAction.id ) {
                case WAIT:
                    npcComponent.hunting = false;
                    keepCalm();
                    break;

                case ANIMATE:
                    npcComponent.hunting = false;
                    keepCalm();
                    forceAnimate = npcAction.nOfAnimation;
                    break;

                case MOVE:
                    npcComponent.hunting = false;
                    npcPosition.set( notFilteredPos.x, notFilteredPos.z );
                    direction.set( npcAction.targetPosition.x, npcAction.targetPosition.y );
                    direction.sub( npcPosition );

                    if ( direction.len() <= 0.1f ) {
                        npcComponent.time = 0;
                        keepCalm();
                    } else {
                        direction.nor();
                        soundByDistance( entity );
                    }

                    break;

                case HUNT:
                    attack = true;

                    npcPosition.set( notFilteredPos.x, notFilteredPos.z );
                    tmp.set( playerPosition ).sub( npcPosition );
                    if ( tmp.len() > 8.0f ) {
                        npcComponent.time = 0;
                        npcComponent.hunting = false;
                    } else {
                        tmp.nor();
                        direction.set( tmp );
                        npcComponent.hunting = true;
                        soundByDistance( entity );
                    }

                    break;

                case SAY:
                    npcComponent.hunting = false;
                    keepCalm();
                    entity.add( new TextDecalComponent( npcAction.text, npcAction.durationTime ) );
                    npcComponent.time = 0;
                    break;
            }
        }

        AnimationComponent animationComponent = MyMapper.ANIMATION.get( entity );

        int IDLE = 0;
        int RUN = 1;
        int ATTACK = 2;
        int HURT = 1;
        //int DIE = 4;

        float speed = 0.0f;

        boolean animationForced = forceAnimate != -1;

        if ( !animationForced ) {
            float directionLen = direction.len();
            // Мы управляем персонажем джойстиком
            if ( directionLen != 0 ) {
                // Персонаж на земле
                float animationSpeed = 1.0f + 1.0f * directionLen;
                if ( !attack ) {
                    animationComponent.queue( RUN, animationSpeed );
                } else {
                    animationComponent.play( ATTACK, animationSpeed );
                    animationComponent.queue( IDLE, 1.0f );
                }

                float runSpeed = 4.0f;
                speed = ( runSpeed + 1 ) * directionLen;

                // Сохраняем угол для поворота модели
                modelAngle = 90 - direction.angle();

                // СОздаем пыль под ногами

                dustTime -= delta;
                if ( dustTime < 0 ) {
                    dustTime = 0.16f;

                    //EntityBuilder.createDustFX( notFilteredPos, 0.6f, GameColor.WHITEGL );
                }
            }
            // Скрипт не управляет персонажем
        } else {
            animationComponent.queue( forceAnimate, 1.0f );
        }

        if ( npcComponent.hurt ) {
            animationComponent.play( HURT, 3.5f );
            animationComponent.queue( IDLE, 1.0f );
            npcComponent.hurt = false;
        }

        //////////////////
        // Двигаем или останавливаем физическое тело
        velocity.set( direction.x, 0, direction.y );
        velocity.scl( speed );
        velocity.add( 0, body.getLinearVelocity().y, 0 );

        body.setLinearVelocity( velocity );

        bodyTransform.idt();
        bodyTransform.setToTranslation( notFilteredPos );
        bodyTransform.rotate( Vector3.Y, modelAngle );
        body.setWorldTransform( bodyTransform );
    }


    private void keepCalm () {
        direction.set( 0, 0 );
        SoundAsset.NPC_STEP.setThisVolume( 0 );
        //walk.setThisVolume( 0.0f );
    }


    private void soundByDistance ( Entity entity ) {
        float MAX_LISTEN_DISTANCE = 20.0f;
        // Set NPC step-sounds by distance of player
        Vector2 playerPosition = new Vector2(  );//MyPlayer.getPosition();
        float distance = MAX_LISTEN_DISTANCE - npcPosition.sub( playerPosition ).len();

        boolean isFlyingNPC = false;
        if ( MyMapper.LEVEL_OBJECT.has( entity ) ) {
            ModelAsset npcAsset = MyMapper.LEVEL_OBJECT.get( entity ).gameObject.getModelAsset();
            /*isFlyingNPC = npcAsset.equals( ModelAsset.BUTTERFLY ) ||
                          npcAsset.equals( ModelAsset.BIRD1 ) ||
                          npcAsset.equals( ModelAsset.BIRD2ANGRY );*/
        }

            //float walkVolume = distance < MAX_LISTEN_DISTANCE ? distance / MAX_LISTEN_DISTANCE : 0;
            //walk.setThisVolume( walkVolume );
            SoundAsset.NPC_STEP.setThisVolume( 1 );
    }


    @Override
    public void removedFromEngine ( Engine engine ) {
        super.removedFromEngine( engine );

        //disableWalkSound();
    }


    public void playWalkSounds () {
        SoundAsset.NPC_STEP.stop();
        SoundAsset.NPC_STEP.play();
        SoundAsset.NPC_STEP.playLoop();
        SoundAsset.NPC_STEP.setThisVolume( 0 );
    }
}
