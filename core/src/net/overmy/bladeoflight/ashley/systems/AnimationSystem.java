package net.overmy.bladeoflight.ashley.systems;

import com.badlogic.ashley.core.Entity;
import com.badlogic.ashley.core.Family;
import com.badlogic.ashley.systems.IteratingSystem;

import net.overmy.bladeoflight.ashley.MyMapper;
import net.overmy.bladeoflight.ashley.component.AnimationComponent;
import net.overmy.bladeoflight.ashley.component.OutOfCameraComponent;


/*
     Created by Andrey Mikheev on 20.04.2017
     Contact me → http://vk.com/id17317
 */

public class AnimationSystem extends IteratingSystem {

    @SuppressWarnings( "unchecked" )
    public AnimationSystem () {
        super( Family.all( AnimationComponent.class )
                     .exclude( OutOfCameraComponent.class ).get() );
    }


    @Override
    protected void processEntity ( Entity entity, float delta ) {
        AnimationComponent component = MyMapper.ANIMATION.get( entity );
        component.controller.update( delta );
    }
}
