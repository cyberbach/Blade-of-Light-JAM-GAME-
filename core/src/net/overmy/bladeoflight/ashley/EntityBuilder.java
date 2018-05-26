package net.overmy.bladeoflight.ashley;

/*
      Created by Andrey Mikheev on 17.03.2018
      Contact me → http://vk.com/id17317
 */

import com.badlogic.ashley.core.Engine;
import com.badlogic.ashley.core.Entity;
import com.badlogic.ashley.utils.ImmutableArray;
import com.badlogic.gdx.graphics.g3d.ModelInstance;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.physics.bullet.collision.btCollisionObject.CollisionFlags;
import com.badlogic.gdx.physics.bullet.dynamics.btRigidBody;

import net.overmy.bladeoflight.BulletWorld;
import net.overmy.bladeoflight.PhysicalBuilder;
import net.overmy.bladeoflight.ashley.component.AnimationComponent;
import net.overmy.bladeoflight.ashley.component.BoundingBoxComponent;
import net.overmy.bladeoflight.ashley.component.CollectableComponent;
import net.overmy.bladeoflight.ashley.component.GroundedComponent;
import net.overmy.bladeoflight.ashley.component.InteractComponent;
import net.overmy.bladeoflight.ashley.component.LevelIDComponent;
import net.overmy.bladeoflight.ashley.component.LevelObjectComponent;
import net.overmy.bladeoflight.ashley.component.LifeComponent;
import net.overmy.bladeoflight.ashley.component.ModelComponent;
import net.overmy.bladeoflight.ashley.component.MyPlayerComponent;
import net.overmy.bladeoflight.ashley.component.NPCComponent;
import net.overmy.bladeoflight.ashley.component.PhysicalComponent;
import net.overmy.bladeoflight.ashley.component.PhysicalConnectComponent;
import net.overmy.bladeoflight.ashley.component.TYPE_OF_ENTITY;
import net.overmy.bladeoflight.ashley.component.TYPE_OF_INTERACT;
import net.overmy.bladeoflight.ashley.component.TypeOfEntityComponent;
import net.overmy.bladeoflight.logic.InteractItem;
import net.overmy.bladeoflight.logic.NPCAction;
import net.overmy.bladeoflight.logic.collectables.TriggerCollectable;
import net.overmy.bladeoflight.logic.objects.GameObject;
import net.overmy.bladeoflight.resources.ModelAsset;


public final class EntityBuilder {


    private static Engine engine = null;


    private EntityBuilder () {
    }


    public static void init ( Engine engineIn ) {
        engine = engineIn;
    }


    public static void dispose () {
        engine = null;
    }


    public static Entity createGround ( ModelAsset modelAsset ) {
        ModelInstance physics = modelAsset.getSimple();
        PhysicalBuilder physicalBuilder = null;
        if ( physics != null ) {
            physicalBuilder = new PhysicalBuilder()
                    .setModelInstance( physics )
                    .defaultMotionState()
                    .zeroMass()
                    .bvhShape()
                    .setCollisionFlag( CollisionFlags.CF_STATIC_OBJECT )
                    .setCallbackFlag( BulletWorld.GROUND_FLAG )
                    .setCallbackFilter( BulletWorld.PLAYER_FLAG );
        }

        Entity entity = new Entity();
        entity.add( new LevelIDComponent( modelAsset.ordinal() ) );
        entity.add( new ModelComponent( modelAsset.get() ) );
        entity.add( new TypeOfEntityComponent( TYPE_OF_ENTITY.GROUND ) );
        if ( physics != null ) {
            entity.add( physicalBuilder.buildPhysicalComponent() );
            entity.add( physicalBuilder.buildBVHPhysicalComponent() );
        }
        entity.add( new BoundingBoxComponent( modelAsset.getBoundingBox() ) );
        engine.addEntity( entity );

        return entity;
    }


    public static btRigidBody createPlayer ( ModelInstance modelInstance, Vector3 position ) {
        PhysicalBuilder physicalBuilder = new PhysicalBuilder()
                .setModelInstance( modelInstance )
                .defaultMotionState()
                .setMass( 20.0f )
                .setPosition( position )
                .capsuleShape(0.5f, 1.0f)
                .setCollisionFlag( CollisionFlags.CF_CHARACTER_OBJECT )
                .setCallbackFlag( BulletWorld.PLAYER_FLAG )
                .setCallbackFilter( BulletWorld.PLAYER_FILTER )
                .disableDeactivation()
                .disableRotation();

        PhysicalComponent physicalComponent = physicalBuilder.buildPhysicalComponent();

        btRigidBody body = physicalBuilder.getSavedBody();

        Entity entity = new Entity();
        entity.add( physicalComponent );
        entity.add( new ModelComponent( modelInstance ) );
        entity.add( new AnimationComponent( modelInstance ) );
        entity.add( new GroundedComponent() );
        entity.add( new LifeComponent( 100.0f, 1, 2 ) );
        entity.add( new TypeOfEntityComponent( TYPE_OF_ENTITY.MYPLAYER ) );
        entity.add( new MyPlayerComponent() );

        engine.addEntity( entity );

        return body;
    }

    public static btRigidBody createGhostCamera (btRigidBody connectBody ) {
        PhysicalBuilder physicalBuilder = new PhysicalBuilder()
                .defaultMotionState()
                .setMass(20.0f)
                .capsuleShape(0.2f,0)
                .setCollisionFlag( CollisionFlags.CF_CUSTOM_MATERIAL_CALLBACK )
                .setCallbackFlag( BulletWorld.CAMERA_FLAG )
                .setCallbackFilter( 0 )
                .disableRotation();

        PhysicalComponent physicalComponent = physicalBuilder.buildPhysicalComponent();

        btRigidBody body = physicalBuilder.getSavedBody();

        Entity entity = new Entity();
        entity.add( physicalComponent );
        entity.add( new TypeOfEntityComponent( TYPE_OF_ENTITY.CAMERA ) );
        entity.add( new PhysicalConnectComponent( connectBody ) );

        engine.addEntity( entity );

        return body;
    }


    public static Entity createPickable ( Vector3 position, InteractItem interactItem ) {
        ModelInstance modelInstance = interactItem.item.getModelAsset().get();

        PhysicalBuilder physicalBuilderPICKABLE = new PhysicalBuilder()
                .setModelInstance( modelInstance )
                .defaultMotionState()
                .setPosition( position )
                .setMass( 1.0f )
                .hullShape()
                .setStartImpulse( new Vector3( 0, 6, 0 ) )
                .setCollisionFlag( CollisionFlags.CF_CUSTOM_MATERIAL_CALLBACK )
                .setCallbackFlag( BulletWorld.PICKABLE_FLAG )
                .setCallbackFilter( BulletWorld.PLAYER_FLAG )
                .disableDeactivation()
                .disableRotation();

        Entity entity = new Entity();
        if ( modelInstance.animations.size > 0 ) {
            entity.add( new AnimationComponent( modelInstance ) );
        }
        entity.add( new ModelComponent( modelInstance ) );
        entity.add( new TypeOfEntityComponent( TYPE_OF_ENTITY.PICKABLE ) );
        entity.add( new InteractComponent( TYPE_OF_INTERACT.LOOT, interactItem ) );
        entity.add( physicalBuilderPICKABLE.buildPhysicalComponent() );
        engine.addEntity( entity );
        return entity;
    }

    public static Entity createTrigger ( GameObject gameObject, TriggerCollectable triggerCollectable, Vector3 position, float size ) {
        PhysicalBuilder physicalBuilderPICKABLE = new PhysicalBuilder()
                .defaultMotionState()
                .setPosition( position )
                .zeroMass()
                .boxShape( size )
                .setCollisionFlag( CollisionFlags.CF_NO_CONTACT_RESPONSE )
                .setCallbackFlag( BulletWorld.PICKABLE_FLAG )
                .setCallbackFilter( BulletWorld.PLAYER_FLAG )
                .disableDeactivation();

        Entity entity = new Entity();
        entity.add( new TypeOfEntityComponent( TYPE_OF_ENTITY.COLLECTABLE ) );
        //entity.add( new InteractComponent( TYPE_OF_INTERACT.LOOT, triggerCollectable ) );
        entity.add( new CollectableComponent( triggerCollectable) );
        entity.add( new LevelObjectComponent( gameObject ) );
        entity.add( physicalBuilderPICKABLE.buildPhysicalComponent() );
        engine.addEntity( entity );
        return entity;
    }


    public static Entity createNPC ( Vector3 position,
                                     ModelAsset modelAsset,
                                     ImmutableArray< NPCAction > actionArray ) {

        ModelInstance modelInstance = modelAsset.get();

        PhysicalBuilder physicalBuilderNPC = new PhysicalBuilder()
                .setModelInstance( modelInstance )
                .defaultMotionState()
                .setPosition( position )
                .setMass( 60.0f )
                .capsuleShape()
                .setCollisionFlag( CollisionFlags.CF_CHARACTER_OBJECT )
                .setCallbackFlag( BulletWorld.NPC_FLAG )
                .setCallbackFilter( BulletWorld.GROUND_FLAG )
                .disableRotation()
                .disableDeactivation();

        PhysicalComponent physicalComponent = physicalBuilderNPC.buildPhysicalComponent();
        physicalComponent.body.setRollingFriction( 0.1f );
        physicalComponent.body.setFriction( 0.1f );
        physicalComponent.body.setSpinningFriction( 0.1f );

        Entity entity = new Entity();
        entity.add( new ModelComponent( modelInstance ) );
        entity.add( new AnimationComponent( modelInstance ) );
        entity.add( new TypeOfEntityComponent( TYPE_OF_ENTITY.NPC ) );
        entity.add( new NPCComponent( actionArray ) );
        entity.add( physicalComponent );
        engine.addEntity( entity );

        return entity;
    }


}