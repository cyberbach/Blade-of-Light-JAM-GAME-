package net.overmy.bladeoflight.screen;

/*
      Created by Andrey Mikheev on 10.10.2017
      Contact me → http://vk.com/id17317
 */

import com.badlogic.gdx.graphics.g3d.utils.AnimationController;
import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.actions.Actions;
import com.badlogic.gdx.scenes.scene2d.ui.Label;
import com.badlogic.gdx.scenes.scene2d.ui.Slider;
import com.badlogic.gdx.scenes.scene2d.utils.ClickListener;
import com.badlogic.gdx.utils.Align;

import net.overmy.bladeoflight.AshleyWorld;
import net.overmy.bladeoflight.Core;
import net.overmy.bladeoflight.MyGdxGame;
import net.overmy.bladeoflight.MyRender;
import net.overmy.bladeoflight.logic.DynamicLevels;
import net.overmy.bladeoflight.resources.FontAsset;
import net.overmy.bladeoflight.resources.GameColor;
import net.overmy.bladeoflight.resources.MusicAsset;
import net.overmy.bladeoflight.resources.Settings;
import net.overmy.bladeoflight.resources.SoundAsset;
import net.overmy.bladeoflight.resources.TextAsset;
import net.overmy.bladeoflight.utils.UIHelper;


public class MenuScreen extends Base2DScreen {

    private static Group introGroup   = null;
    private static Group optionsGroup = null;

    // setting bars
    private static Slider soundBar          = null;
    private static Slider musicBar          = null;
    private static Slider verticalSensBar   = null;
    private static Slider horizontalSensBar = null;

    private GUI_TYPE guiType;


    public MenuScreen ( MyGdxGame game ) {
        super( game );
    }


    private AnimationController animationController = null;


    @Override
    public void show () {
        super.show();

        MyRender.getStage().addActor( optionsGroup = new Group() );
        MyRender.getStage().addActor( introGroup = new Group() );

        updateVolume();
        updateSensitivity();

        showIntroGUI();
    }


    @Override
    public void draw ( float delta ) {
    }


    private void showIntroGUI () {
        guiType = GUI_TYPE.MAIN_MENU;
        introGroup.clear(); // disable clearGroup Runnable

        Label title = UIHelper.Label( TextAsset.Title.get(), FontAsset.MENU_TITLE );
        title.setAlignment( Align.center );
        final Group titleGroup = UIHelper.convertActorToGroup( title );
        titleGroup.setPosition( Core.WIDTH_HALF, Core.HEIGHT * 0.8f );
        titleGroup.addAction( Actions.forever(
                Actions.sequence(
                        Actions.scaleTo( 1.2f, 1.2f, 1, Interpolation.exp5Out ),
                        Actions.scaleTo( 1.0f, 1.0f, 1, Interpolation.exp5In )
                                )
                                             ) );
        introGroup.addActor( titleGroup );

        // FIXME нужен рефактор
        /*final boolean canResume = MyPlayer.live && DynamicLevels.getCurrent() != 0;*/

        final float labelPosX = Core.WIDTH * 0.75f;
        final float label2PosY = Core.HEIGHT * 0.23f;
        final float label1PosY = Core.HEIGHT * 0.35f;
        final float label3PosY = Core.HEIGHT * 0.47f;
        final float leftPosX = -Core.WIDTH_HALF; // over screen position
        final float rightPosX = Core.WIDTH; // over screen position

        final Label startLabel = new Label( TextAsset.StartGame.get(),
                                            FontAsset.MENU_TITLE.getStyle() );
        startLabel.setColor( GameColor.LIGHT.get() );

        final Label settingsLabel = new Label( TextAsset.Options.get(),
                                               FontAsset.MENU_TITLE.getStyle() );
        settingsLabel.setColor( GameColor.LIGHT.get() );

        introGroup.addActor( startLabel );
        introGroup.addActor( settingsLabel );
        /*if ( canResume ) {
            introGroup.addActor( resumeLabel );
        }*/

        UIHelper.rollIn( startLabel, rightPosX, label1PosY, labelPosX, label1PosY );
        startLabel.addListener( new ClickListener() {
            @Override
            public void clicked ( InputEvent event, float x, float y ) {
                //SoundAsset.Click.play();
                UIHelper.clickAnimation( startLabel );
                UIHelper.rollOut( startLabel, labelPosX, label1PosY, leftPosX, label1PosY );
                UIHelper.rollOut( settingsLabel, labelPosX, label2PosY, leftPosX, label2PosY );

                DynamicLevels.initLevels();
                DynamicLevels.setCurrent( 0 );
                //AshleyWorld.dispose();
                AshleyWorld.init();

                //MyPlayer.clearAll();

                UIHelper.rollOut( titleGroup, Core.WIDTH_HALF, Core.HEIGHT * 0.8f, Core.WIDTH_HALF,
                                  Core.HEIGHT * 1.5f );
                transitionTo( MyGdxGame.SCREEN_TYPE.LOADING_GAME );
            }
        } );
/*

        if ( canResume ) {
            UIHelper.rollIn( resumeLabel, rightPosX, label3PosY, labelPosX, label3PosY );
            resumeLabel.addListener( new ClickListener() {
                @Override
                public void clicked ( InputEvent event, float x, float y ) {
                    //SoundAsset.Click.play();
                    UIHelper.clickAnimation( resumeLabel );
                    UIHelper.rollOut( startLabel, labelPosX, label1PosY, leftPosX, label1PosY );
                    UIHelper.rollOut( settingsLabel, labelPosX, label2PosY, leftPosX, label2PosY );
                    UIHelper.rollOut( resumeLabel, labelPosX, label3PosY, leftPosX, label3PosY );

                    transitionTo( MyGdxGame.SCREEN_TYPE.LOADING_GAME );

                    UIHelper.rollOut( titleGroup, Core.WIDTH_HALF, Core.HEIGHT * 0.8f,
                                      Core.WIDTH_HALF, Core.HEIGHT * 1.5f );
                }
            } );
        }
*/

        UIHelper.rollIn( settingsLabel, rightPosX, label2PosY, labelPosX, label2PosY );
        settingsLabel.addListener( new ClickListener() {
            @Override
            public void clicked ( InputEvent event, float x, float y ) {
                //SoundAsset.Click.play();
                UIHelper.rollOut( settingsLabel, labelPosX, label2PosY, leftPosX, label2PosY );
                UIHelper.rollOut( startLabel, labelPosX, label1PosY, leftPosX, label1PosY );
                titleGroup.clearActions();
                UIHelper.rollOut( titleGroup, Core.WIDTH_HALF, Core.HEIGHT * 0.8f, Core.WIDTH_HALF,
                                  Core.HEIGHT * 1.5f );
                showSettingsGUI();
            }
        } );
    }


    private void showSettingsGUI () {
        guiType = GUI_TYPE.OPTIONS;
        optionsGroup.clear(); // clear Runnable

        optionsGroup.setPosition( 0, 0 );
        optionsGroup.addActor( UIHelper.BlackBG() );
        optionsGroup.addAction( Actions.alpha( 1, Core.FADE ) );

        Label optionsTitleLabel = new Label( TextAsset.Options.get(),
                                             FontAsset.MENU_TITLE.getStyle() );
        optionsTitleLabel.setPosition( Core.WIDTH_HALF - optionsTitleLabel.getWidth() / 2,
                                       Core.HEIGHT * 0.75f );
        optionsGroup.addActor( optionsTitleLabel );

        optionsGroup.addActor( UIHelper.MenuLabel( TextAsset.Sound.get(), Core.HEIGHT * 0.6f ) );
        if ( soundBar == null ) {
            soundBar = UIHelper.Bar( GameColor.LIGHT.get() );
            soundBar.setWidth( Core.WIDTH * 0.55f );
            soundBar.invalidate();
            soundBar.setValue( Settings.SOUND.getInteger() );
            soundBar.setPosition( Core.WIDTH * 0.35f, Core.HEIGHT * 0.6f );
        }
        optionsGroup.addActor( soundBar );

        optionsGroup.addActor( UIHelper.MenuLabel( TextAsset.Music.get(), Core.HEIGHT * 0.45f ) );
        if ( musicBar == null ) {
            musicBar = UIHelper.Bar( GameColor.LIGHT.get() );
            musicBar.setWidth( Core.WIDTH * 0.55f );
            musicBar.invalidate();
            musicBar.setValue( Settings.MUSIC.getInteger() );
            musicBar.setPosition( Core.WIDTH * 0.35f, Core.HEIGHT * 0.45f );
        }
        optionsGroup.addActor( musicBar );

        optionsGroup.addActor( UIHelper.MenuLabel( TextAsset.Horiz.get(), Core.HEIGHT * 0.3f ) );
        if ( horizontalSensBar == null ) {
            horizontalSensBar = UIHelper.Bar( GameColor.LIGHT.get() );
            horizontalSensBar.setWidth( Core.WIDTH * 0.55f );
            horizontalSensBar.invalidate();
            horizontalSensBar.setValue( Settings.HORIZ_SENS.getInteger() );
            horizontalSensBar.setPosition( Core.WIDTH * 0.35f, Core.HEIGHT * 0.3f );
        }
        optionsGroup.addActor( horizontalSensBar );

        optionsGroup.addActor( UIHelper.MenuLabel( TextAsset.Vert.get(), Core.HEIGHT * 0.15f ) );
        if ( verticalSensBar == null ) {
            verticalSensBar = UIHelper.Bar( GameColor.LIGHT.get() );
            verticalSensBar.setWidth( Core.WIDTH * 0.55f );
            verticalSensBar.invalidate();
            verticalSensBar.setValue( Settings.VERT_SENS.getInteger() );
            verticalSensBar.setPosition( Core.WIDTH * 0.35f, Core.HEIGHT * 0.15f );
        }
        optionsGroup.addActor( verticalSensBar );
    }


    @Override
    public void backButton () {
        //SoundAsset.BackSound.play();
        if ( guiType == GUI_TYPE.OPTIONS ) {
            showIntroGUI();
            UIHelper.rollOut( optionsGroup, 0, 0, -Core.WIDTH, 0 );

            saveVolumeToSettings();
            saveSensitivityToSettings();
        } else {
            UIHelper.rollOut( introGroup, 0, 0, -Core.WIDTH_HALF, 0 );

            transitionTo( MyGdxGame.SCREEN_TYPE.EXIT );
        }
    }


    private void saveVolumeToSettings () {
        Settings.SOUND.setInteger( (int) soundBar.getValue() );
        Settings.MUSIC.setInteger( (int) musicBar.getValue() );
        updateVolume();
    }


    private void updateVolume () {
        SoundAsset.setVolume( (float)Settings.SOUND.getInteger() / 100.0f );
        MusicAsset.setVolume((float)Settings.MUSIC.getInteger() / 100.0f);

        MusicAsset.Main.play( true );

    }


    private void saveSensitivityToSettings () {
        Settings.HORIZ_SENS.setInteger( (int) horizontalSensBar.getValue() );
        Settings.VERT_SENS.setInteger( (int) verticalSensBar.getValue() );
        updateSensitivity();
    }


    private void updateSensitivity () {
        Core.SensitivitySpeedByX = sensIntToFloat( Settings.HORIZ_SENS.getInteger() );
        Core.SensitivitySpeedByY = sensIntToFloat( Settings.VERT_SENS.getInteger() );
    }


    @Override
    public void dispose () {
        super.dispose();

        introGroup = null;
        optionsGroup = null;
        soundBar = null;
        musicBar = null;
        verticalSensBar = null;
        horizontalSensBar = null;
    }


    private enum GUI_TYPE {
        MAIN_MENU,
        OPTIONS
    }


    // FIXME написать через алгоритм
    private static float sensIntToFloat ( int value ) {
        switch ( value ) {
            default:
                return 0.000001f;
            case 5:
                return 0.000017f;
            case 10:
                return 0.00003f;
            case 15:
                return 0.000056f;
            case 20:
                return 0.0001f;
            case 25:
                return 0.00018f;
            case 30:
                return 0.00033f;
            case 35:
                return 0.0006f;
            case 40:
                return 0.001f;
            case 45:
                return 0.002f;
            case 50:
                return 0.0037f;
            case 55:
                return 0.0067f;
            case 60:
                return 0.012f;
            case 65:
                return 0.022f;
            case 70:
                return 0.04f;
            case 75:
                return 0.073f;
            case 80:
                return 0.13f;
            case 85:
                return 0.242f;
            case 90:
                return 0.44f;
            case 95:
                return 0.8f;
            case 100:
                return 1f;
        }
    }
}
