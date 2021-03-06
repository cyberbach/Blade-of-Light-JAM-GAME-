package net.overmy.bladeoflight.ashley;

/*
     Created by Andrey Mikheev on 20.04.2017
     Contact me → http://vk.com/id17317
 */

import com.badlogic.ashley.core.ComponentMapper;

import net.overmy.bladeoflight.ashley.component.AnimationComponent;
import net.overmy.bladeoflight.ashley.component.BoundingBoxComponent;
import net.overmy.bladeoflight.ashley.component.CollectableComponent;
import net.overmy.bladeoflight.ashley.component.ContainerComponent;
import net.overmy.bladeoflight.ashley.component.DecalComponent;
import net.overmy.bladeoflight.ashley.component.DoorComponent;
import net.overmy.bladeoflight.ashley.component.GroundedComponent;
import net.overmy.bladeoflight.ashley.component.InteractComponent;
import net.overmy.bladeoflight.ashley.component.LevelIDComponent;
import net.overmy.bladeoflight.ashley.component.LevelObjectComponent;
import net.overmy.bladeoflight.ashley.component.LifeComponent;
import net.overmy.bladeoflight.ashley.component.ModelComponent;
import net.overmy.bladeoflight.ashley.component.MyPlayerComponent;
import net.overmy.bladeoflight.ashley.component.NPCComponent;
import net.overmy.bladeoflight.ashley.component.OutOfCameraComponent;
import net.overmy.bladeoflight.ashley.component.PhysicalBVHComponent;
import net.overmy.bladeoflight.ashley.component.PhysicalComponent;
import net.overmy.bladeoflight.ashley.component.PhysicalConnectComponent;
import net.overmy.bladeoflight.ashley.component.PositionComponent;
import net.overmy.bladeoflight.ashley.component.RemoveByTimeComponent;
import net.overmy.bladeoflight.ashley.component.SkipScriptComponent;
import net.overmy.bladeoflight.ashley.component.Stage2DGroupComponent;
import net.overmy.bladeoflight.ashley.component.TextDecalComponent;
import net.overmy.bladeoflight.ashley.component.TypeOfEntityComponent;
import net.overmy.bladeoflight.ashley.component.WeaponComponent;


public final class MyMapper {
    public static ComponentMapper< PositionComponent >     POSITION       = null;
    public static ComponentMapper< AnimationComponent >    ANIMATION      = null;
    public static ComponentMapper< PhysicalComponent >     PHYSICAL       = null;
    static        ComponentMapper< PhysicalBVHComponent >  BVH_PHYSICAL   = null;
    public static ComponentMapper< PhysicalConnectComponent > CONNECT_PHYSICAL = null;
    public static ComponentMapper< ModelComponent >           MODEL            = null;
    public static ComponentMapper< GroundedComponent >     GROUNDED       = null;
    public static ComponentMapper< OutOfCameraComponent >  OUT_OF_CAMERA  = null;
    public static ComponentMapper< BoundingBoxComponent >  BOUNDS         = null;
    public static ComponentMapper< TypeOfEntityComponent >    TYPE             = null;
    public static ComponentMapper< LevelIDComponent >      REMOVE_BY_ZONE = null;
    public static ComponentMapper< RemoveByTimeComponent >    REMOVE_BY_TIME   = null;
    public static ComponentMapper< DecalComponent >        DECAL          = null;
    public static ComponentMapper< InteractComponent >     INTERACT       = null;
    public static ComponentMapper< NPCComponent >          NPC            = null;
    public static ComponentMapper< TextDecalComponent >    TEXT_DECAL     = null;
    public static ComponentMapper< LevelObjectComponent >  LEVEL_OBJECT   = null;
    public static ComponentMapper< WeaponComponent >       MY_WEAPON      = null;
    public static ComponentMapper< LifeComponent >         LIFE           = null;
    public static ComponentMapper< ContainerComponent >    CONTAINER      = null;
    public static ComponentMapper< Stage2DGroupComponent > GROUP_IN_STAGE = null;
    public static ComponentMapper< SkipScriptComponent >   SKIP           = null;
    public static ComponentMapper< DoorComponent >         DOOR           = null;
    public static ComponentMapper< MyPlayerComponent >     MY_PLAYER      = null;
    public static ComponentMapper< CollectableComponent >  COLLECTABLE    = null;


    private MyMapper () {
    }


    public static void init () {
        PHYSICAL = ComponentMapper.getFor( PhysicalComponent.class );
        BVH_PHYSICAL = ComponentMapper.getFor( PhysicalBVHComponent.class );
        CONNECT_PHYSICAL = ComponentMapper.getFor( PhysicalConnectComponent.class );
        POSITION = ComponentMapper.getFor( PositionComponent.class );
        ANIMATION = ComponentMapper.getFor( AnimationComponent.class );
        MODEL = ComponentMapper.getFor( ModelComponent.class );
        GROUNDED = ComponentMapper.getFor( GroundedComponent.class );
        OUT_OF_CAMERA = ComponentMapper.getFor( OutOfCameraComponent.class );
        BOUNDS = ComponentMapper.getFor( BoundingBoxComponent.class );
        TYPE = ComponentMapper.getFor( TypeOfEntityComponent.class );
        REMOVE_BY_ZONE = ComponentMapper.getFor( LevelIDComponent.class );
        REMOVE_BY_TIME = ComponentMapper.getFor( RemoveByTimeComponent.class );
        DECAL = ComponentMapper.getFor( DecalComponent.class );
        INTERACT = ComponentMapper.getFor( InteractComponent.class );
        NPC = ComponentMapper.getFor( NPCComponent.class );
        TEXT_DECAL = ComponentMapper.getFor( TextDecalComponent.class );
        LEVEL_OBJECT = ComponentMapper.getFor( LevelObjectComponent.class );
        MY_WEAPON = ComponentMapper.getFor( WeaponComponent.class );
        LIFE = ComponentMapper.getFor( LifeComponent.class );
        CONTAINER = ComponentMapper.getFor( ContainerComponent.class );
        GROUP_IN_STAGE = ComponentMapper.getFor( Stage2DGroupComponent.class );
        SKIP = ComponentMapper.getFor( SkipScriptComponent.class );
        DOOR = ComponentMapper.getFor( DoorComponent.class );
        MY_PLAYER = ComponentMapper.getFor( MyPlayerComponent.class );
        COLLECTABLE = ComponentMapper.getFor( CollectableComponent.class );
    }


    public static void dispose () {
        PHYSICAL  = null;
        BVH_PHYSICAL  = null;
        CONNECT_PHYSICAL  = null;
        POSITION  = null;
        ANIMATION  = null;
        MODEL = null;
        GROUNDED = null;
        OUT_OF_CAMERA = null;
        BOUNDS =null;
        TYPE = null;
        REMOVE_BY_ZONE = null;
        REMOVE_BY_TIME = null;
        DECAL =null;
        INTERACT = null;
        NPC = null;
        TEXT_DECAL = null;
        LEVEL_OBJECT = null;
        MY_WEAPON = null;
        LIFE = null;
        CONTAINER = null;
        GROUP_IN_STAGE = null;
        SKIP = null;
        DOOR = null;
        MY_PLAYER = null;
        COLLECTABLE = null;
    }
}
