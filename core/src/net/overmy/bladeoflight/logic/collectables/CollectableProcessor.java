package net.overmy.bladeoflight.logic.collectables;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.MathUtils;

import net.overmy.bladeoflight.Core;
import net.overmy.bladeoflight.MyCamera;
import net.overmy.bladeoflight.ashley.EntityBuilder;
import net.overmy.bladeoflight.logic.cutscenes.CutScene;
import net.overmy.bladeoflight.logic.cutscenes.SCENE_ID;
import net.overmy.bladeoflight.resources.SoundAsset;
import net.overmy.bladeoflight.resources.TextAsset;


/*
        Created by Andrey Mikheev on 18.05.2018
        Contact me → http://vk.com/id17317
*/
public class CollectableProcessor {
    private CollectableProcessor () {
    }


    public static void process ( Collectable collectable ) {
        switch ( MathUtils.random( 0,5 ) ){
            case 0:
                SoundAsset.A1.play();
                break;
            case 1:
                SoundAsset.A2.play();
                break;
            case 2:
                SoundAsset.A3.play();
                break;
            case 3:
                SoundAsset.A4.play();
                break;
            default:
                SoundAsset.A5.play();
                break;
        }

        if ( collectable instanceof TriggerCollectable ) {
            TriggerCollectable triggerCollectable = (TriggerCollectable) collectable;
            switch ( triggerCollectable.trigger ) {
                /*case MY_TEST_TIRGGER:
                    Gdx.app.debug( "processssed", "MY_TEST_TIRGGER- 4 seconds" );
                    CutScene.start( SCENE_ID.SOME_SCENE, 4 );
                    break;*/

                case TRIGGER_GAMEOVER:
                    Core.playerDie = true;
                    EntityBuilder.createText( TextAsset.WIN.get() );
                    MyCamera.block();
                    break;

                case TRIGGER_GAMEINTRO:
                    EntityBuilder.createText(TextAsset.INTRO.get());
                    break;

                case TRIGGER1:
                    EntityBuilder.createText(TextAsset.TEXT1.get());
                    break;

                case TRIGGER2:
                    EntityBuilder.createText(TextAsset.TEXT2.get());
                    break;

                case TRIGGER3:
                    EntityBuilder.createText(TextAsset.TEXT3.get());
                    break;

                case TRIGGER4:
                    EntityBuilder.createText(TextAsset.TEXT4.get());
                    break;

                case TRIGGER5:
                    EntityBuilder.createText(TextAsset.TEXT5.get());
                    break;

                case TRIGGER6:
                    EntityBuilder.createText(TextAsset.TEXT6.get());
                    break;

                case TRIGGER7:
                    EntityBuilder.createText(TextAsset.TEXT7.get());
                    break;
            }
        }
    }
}
