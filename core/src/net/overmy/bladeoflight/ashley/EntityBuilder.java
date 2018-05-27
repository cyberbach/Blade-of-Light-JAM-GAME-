package net.overmy.bladeoflight.ashley;

/*
      Created by Andrey Mikheev on 17.03.2018
      Contact me → http://vk.com/id17317
 */

import com.badlogic.ashley.core.Engine;
import com.badlogic.ashley.core.Entity;
import com.badlogic.ashley.utils.ImmutableArray;
import com.badlogic.gdx.graphics.g2d.Sprite;
import com.badlogic.gdx.graphics.g3d.Material;
import com.badlogic.gdx.graphics.g3d.ModelInstance;
import com.badlogic.gdx.graphics.g3d.attributes.ColorAttribute;
import com.badlogic.gdx.graphics.g3d.model.Node;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.physics.bullet.collision.btCollisionObject.CollisionFlags;
import com.badlogic.gdx.physics.bullet.dynamics.btRigidBody;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.scenes.scene2d.actions.Actions;
import com.badlogic.gdx.scenes.scene2d.ui.Image;
import com.badlogic.gdx.scenes.scene2d.ui.Label;
import com.badlogic.gdx.utils.Align;

import net.overmy.bladeoflight.BulletWorld;
import net.overmy.bladeoflight.Core;
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
import net.overmy.bladeoflight.ashley.component.PositionComponent;
import net.overmy.bladeoflight.ashley.component.RemoveByTimeComponent;
import net.overmy.bladeoflight.ashley.component.Stage2DGroupComponent;
import net.overmy.bladeoflight.ashley.component.TYPE_OF_ENTITY;
import net.overmy.bladeoflight.ashley.component.TYPE_OF_INTERACT;
import net.overmy.bladeoflight.ashley.component.TypeOfEntityComponent;
import net.overmy.bladeoflight.ashley.component.WeaponComponent;
import net.overmy.bladeoflight.logic.InteractItem;
import net.overmy.bladeoflight.logic.NPCAction;
import net.overmy.bladeoflight.logic.collectables.TriggerCollectable;
import net.overmy.bladeoflight.logic.objects.GameObject;
import net.overmy.bladeoflight.resources.FontAsset;
import net.overmy.bladeoflight.resources.GameColor;
import net.overmy.bladeoflight.resources.ModelAsset;
import net.overmy.bladeoflight.utils.GFXHelper;
import net.overmy.bladeoflight.utils.UIHelper;


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


    public static void createText ( String myText ) {
        Label text = UIHelper.Label( myText, FontAsset.MENU_TITLE );
        text.setAlignment( Align.center );
        text.setWrap( true );

        Group textGroup = new Group();
        final float time = MathUtils.random( Core.FADE * 0.2f, Core.FADE );

        // Text Background
        int w = (int) ( text.getWidth() * 1.2f );
        int h = (int) ( text.getHeight() * 1.1f );
        Sprite bgSprite = GFXHelper.createSpriteRGB888( w, h );
        Image bgImage = new Image( bgSprite );
        bgImage.setColor( GameColor.BG.get() );
        bgImage.setOrigin( w / 2, h / 2 );
        bgImage.setPosition( -w / 2, -h / 2 );
        bgImage.setScale( 0, 0 );
        float lifeTime = 5.0f - time;
        bgImage.addAction( Actions.sequence(
                Actions.scaleTo( 0, 0, 0 ),
                Actions.scaleTo( 1, 1, time / 2 ),
                Actions.scaleTo( 0.86f, 0.9f, lifeTime / 3 ),
                Actions.scaleTo( 1.1f, 1.2f, lifeTime / 3 ),
                Actions.scaleTo( 1.0f, 1.0f, lifeTime / 3 ),
                Actions.scaleTo( 0, 0, time / 2 ) ) );

        textGroup.addActor( bgImage );
        textGroup.addActor( text );
        textGroup.setPosition( Core.WIDTH_HALF, Core.HEIGHT * 0.8f );
        textGroup.setScale( 0, 0 );

        // Group animation
        textGroup.addAction( Actions.sequence(
                Actions.scaleTo( 0, 0, 0 ),
                Actions.scaleTo( 1, 1, time ),
                Actions.delay( lifeTime - time ),
                Actions.scaleTo( 0, 0, time ) ) );

        Entity timerEntity = new Entity();
        timerEntity.add( new Stage2DGroupComponent( textGroup ) );
        timerEntity.add( new RemoveByTimeComponent( 5.0f ) );
        engine.addEntity( timerEntity );
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

        ModelInstance levelInstance;

        Entity entity = new Entity();
        entity.add( new LevelIDComponent( modelAsset.ordinal() ) );
        entity.add( new ModelComponent( levelInstance = modelAsset.get() ) );
        if(levelInstance.animations.size>0){
            entity.add( new AnimationComponent( levelInstance ) );
        }
        entity.add( new TypeOfEntityComponent( TYPE_OF_ENTITY.GROUND ) );
        if ( physics != null ) {
            entity.add( physicalBuilder.buildPhysicalComponent() );
            entity.add( physicalBuilder.buildBVHPhysicalComponent() );
        }
        entity.add( new BoundingBoxComponent( modelAsset.getBoundingBox() ) );
        engine.addEntity( entity );

        for( Material a : levelInstance.materials){
            a.clear();
            ColorAttribute diffuse = ColorAttribute.createDiffuse( GameColor.BG.get() );
            a.set( diffuse );
        }

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

    public static void createWeapon(Node rightArmNode, Matrix4 transform){
        ModelInstance weaponInstance = ModelAsset.SWORD.get();

        for( Material a : weaponInstance.materials){
            a.clear();
            ColorAttribute diffuse = ColorAttribute.createDiffuse( GameColor.LIGHT.get() );
            a.set( diffuse );
        }

        PhysicalBuilder physicalBuilder2 = new PhysicalBuilder()
                .setModelInstance( ModelAsset.SWORD.getSimple() )
                .defaultMotionState()
                .zeroMass()
                .hullShape()
                .setCollisionFlag( CollisionFlags.CF_NO_CONTACT_RESPONSE )
                .setCallbackFlag( BulletWorld.MYWEAPON_FLAG )
                .setCallbackFilter( BulletWorld.NPC_FLAG )
                .disableDeactivation();

        // attach only model without physics
        weaponInstance.nodes.get( 0 ).attachTo( rightArmNode );

        Entity weaponEntity = new Entity();
        weaponEntity.add( new TypeOfEntityComponent( TYPE_OF_ENTITY.WEAPON ) );
        weaponEntity.add( new WeaponComponent( rightArmNode, transform ) );
        weaponEntity.add( physicalBuilder2.buildPhysicalComponent() );

        engine.addEntity( weaponEntity );
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


        PhysicalBuilder physicalBuilderNPC;


        if(modelAsset.equals( ModelAsset.SPIDER1 )) {
            physicalBuilderNPC = new PhysicalBuilder()
                    .setModelInstance( modelInstance )
                    .defaultMotionState()
                    .setPosition( position )
                    .setMass( 60.0f )
                    .capsuleShape(1.5f,0)
                    .setCollisionFlag( CollisionFlags.CF_CHARACTER_OBJECT )
                    .setCallbackFlag( BulletWorld.NPC_FLAG )
                    .setCallbackFilter( BulletWorld.ENEMY_FILTER )
                    .disableRotation()
                    .disableDeactivation();
        }else if(modelAsset.equals( ModelAsset.SPIDER1 )){
            physicalBuilderNPC = new PhysicalBuilder()
                    .setModelInstance( modelInstance )
                    .defaultMotionState()
                    .setPosition( position )
                    .setMass( 60.0f )
                    .capsuleShape(1.0f,1)
                    .setCollisionFlag( CollisionFlags.CF_CHARACTER_OBJECT )
                    .setCallbackFlag( BulletWorld.NPC_FLAG )
                    .setCallbackFilter( BulletWorld.ENEMY_FILTER )
                    .disableRotation()
                    .disableDeactivation();
        }else if(modelAsset.equals( ModelAsset.MONSTER1 )){
            physicalBuilderNPC = new PhysicalBuilder()
                    .setModelInstance( modelInstance )
                    .defaultMotionState()
                    .setPosition( position )
                    .setMass( 60.0f )
                    .capsuleShape(1.5f,1.5f)
                    .setCollisionFlag( CollisionFlags.CF_CHARACTER_OBJECT )
                    .setCallbackFlag( BulletWorld.NPC_FLAG )
                    .setCallbackFilter( BulletWorld.ENEMY_FILTER )
                    .disableRotation()
                    .disableDeactivation();
        }else if(modelAsset.equals( ModelAsset.DRAKON1 )){
            physicalBuilderNPC = new PhysicalBuilder()
                    .setModelInstance( modelInstance )
                    .defaultMotionState()
                    .setPosition( position )
                    .setMass( 60.0f )
                    .capsuleShape(1.5f,1.0f)
                    .setCollisionFlag( CollisionFlags.CF_CHARACTER_OBJECT )
                    .setCallbackFlag( BulletWorld.NPC_FLAG )
                    .setCallbackFilter( BulletWorld.ENEMY_FILTER )
                    .disableRotation()
                    .disableDeactivation();
        }else{
            physicalBuilderNPC = new PhysicalBuilder()
                    .setModelInstance( modelInstance )
                    .defaultMotionState()
                    .setPosition( position )
                    .setMass( 60.0f )
                    .capsuleShape()
                    .setCollisionFlag( CollisionFlags.CF_CHARACTER_OBJECT )
                    .setCallbackFlag( BulletWorld.NPC_FLAG )
                    .setCallbackFilter( BulletWorld.ENEMY_FILTER )
                    .disableRotation()
                    .disableDeactivation();
        }

        PhysicalComponent physicalComponent = physicalBuilderNPC.buildPhysicalComponent();
        physicalComponent.body.setRollingFriction( 0.1f );
        physicalComponent.body.setFriction( 0.1f );
        physicalComponent.body.setSpinningFriction( 0.1f );

        Entity entity = new Entity();
        entity.add( new ModelComponent( modelInstance ) );
        entity.add( new AnimationComponent( modelInstance ) );
        entity.add( new TypeOfEntityComponent( TYPE_OF_ENTITY.NPC ) );
        entity.add( new LifeComponent( 100.0f, 3, 2 ) );
        entity.add( new NPCComponent( actionArray ) );
        entity.add( physicalComponent );
        engine.addEntity( entity );

        return entity;
    }


    public static void create5StarsFX ( Vector3 position ) {
        for ( int i = 0; i < 4; i++ ) {
            float fxTime = MathUtils.random( 0.25f, 1.35f );
            Entity entity = new Entity();
            entity.add( DecalSubs.StarsEffect( fxTime ) );
            entity.add( new PositionComponent( position ) );
            entity.add( new RemoveByTimeComponent( fxTime ) );
            engine.addEntity( entity );
        }
    }

    public static void create25StarsFX ( Vector3 position ) {
        for ( int i = 0; i < 24; i++ ) {
            float fxTime = MathUtils.random( 0.75f, 3.35f );
            Entity entity = new Entity();
            entity.add( DecalSubs.StarsEffect2( fxTime ) );
            entity.add( new PositionComponent( position ) );
            entity.add( new RemoveByTimeComponent( fxTime ) );
            engine.addEntity( entity );
        }
    }

}
