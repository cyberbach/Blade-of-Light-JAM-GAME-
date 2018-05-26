package net.overmy.bladeoflight;

/*
     Created by Andrey Mikheev on 20.04.2017
     Contact me → http://vk.com/id17317
 */

import com.badlogic.ashley.core.Engine;
import com.badlogic.gdx.Gdx;

import net.overmy.bladeoflight.ashley.EntityBuilder;
import net.overmy.bladeoflight.ashley.MyEntityListener;
import net.overmy.bladeoflight.ashley.MyMapper;
import net.overmy.bladeoflight.ashley.systems.AnimationSystem;
import net.overmy.bladeoflight.ashley.systems.DecalSystem;
import net.overmy.bladeoflight.ashley.systems.DoorSystem;
import net.overmy.bladeoflight.ashley.systems.InteractSystem;
import net.overmy.bladeoflight.ashley.systems.LifeSystem;
import net.overmy.bladeoflight.ashley.systems.MyPlayerSystem;
import net.overmy.bladeoflight.ashley.systems.NPCSystem;
import net.overmy.bladeoflight.ashley.systems.PhysicalConnectSystem;
import net.overmy.bladeoflight.ashley.systems.PhysicalSystem;
import net.overmy.bladeoflight.ashley.systems.RemoveByTimeSystem;
import net.overmy.bladeoflight.ashley.systems.RenderSystem;
import net.overmy.bladeoflight.ashley.systems.RotationPhysicSystem;
import net.overmy.bladeoflight.ashley.systems.TextDecalSystem;
import net.overmy.bladeoflight.ashley.systems.WeaponSystem;


public final class AshleyWorld {
    public static Engine getEngine () {
        return engine;
    }


    private static Engine engine = null;


    private AshleyWorld () {
    }


    public static void init () {
        engine = new Engine();

        EntityBuilder.init( engine );
        MyMapper.init();

        engine.addSystem( new LifeSystem() );
        engine.addSystem( new MyPlayerSystem() );
        engine.addSystem( new RemoveByTimeSystem() );
        engine.addSystem( new NPCSystem() );
        engine.addSystem( new WeaponSystem() );
        engine.addSystem( new AnimationSystem() );
        engine.addSystem( new RotationPhysicSystem() );
        engine.addSystem( new PhysicalConnectSystem() );
        engine.addSystem( new PhysicalSystem() );
        engine.addSystem( new RenderSystem() );
        engine.addSystem( new TextDecalSystem() );
        engine.addSystem( new DecalSystem() );
        engine.addSystem( new InteractSystem() );
        engine.addSystem( new DoorSystem() );

        engine.addEntityListener( new MyEntityListener() );
    }


    public static void dispose () {
        engine.removeSystem( engine.getSystem( LifeSystem.class ) );
        engine.removeSystem( engine.getSystem( MyPlayerSystem.class ) );
        engine.removeSystem( engine.getSystem( RemoveByTimeSystem.class ) );
        engine.removeSystem( engine.getSystem( NPCSystem.class ) );
        engine.removeSystem( engine.getSystem( AnimationSystem.class ) );
        engine.removeSystem( engine.getSystem( RotationPhysicSystem.class ) );
        engine.removeSystem( engine.getSystem( PhysicalSystem.class ) );
        engine.removeSystem( engine.getSystem( RenderSystem.class ) );
        engine.removeSystem( engine.getSystem( PhysicalConnectSystem.class ) );
        engine.removeSystem( engine.getSystem( DecalSystem.class ) );
        engine.removeSystem( engine.getSystem( InteractSystem.class ) );
        engine.removeSystem( engine.getSystem( WeaponSystem.class ) );
        engine.removeSystem( engine.getSystem( DoorSystem.class ) );

        engine.removeAllEntities();
        engine = null;

        EntityBuilder.dispose();
        MyMapper.dispose();
    }


    public static void update ( float delta ) {
        engine.update( delta );

        if ( DEBUG.CONTACTS.get() ) {
            Gdx.app.debug( "================================== ashley update",
                           "tick ===============================" );
        }
    }
}
