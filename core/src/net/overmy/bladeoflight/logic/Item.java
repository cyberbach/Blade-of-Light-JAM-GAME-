package net.overmy.bladeoflight.logic;

/*
     Created by Andrey Mikheev on 20.04.2017
     Contact me → http://vk.com/id17317
 */

import com.badlogic.gdx.scenes.scene2d.ui.Image;

import net.overmy.bladeoflight.resources.IMG;
import net.overmy.bladeoflight.resources.ModelAsset;
import net.overmy.bladeoflight.resources.TextAsset;


public enum Item {
    //TRIGGER01
    ;

    private TextAsset  name       = null;
    private TextAsset  about      = null;
    private IMG        imageID    = null;
    private ModelAsset modelAsset = null;
    private boolean    weapon     = false;


    public boolean isWeapon () {
        return weapon;
    }


    public static void init () {

    }


    private void setModel ( ModelAsset modelAsset ) {
        this.modelAsset = modelAsset;
    }


    private Item setName ( TextAsset name ) {
        this.name = name;
        return this;
    }


    private Item itIsWeapon () {
        this.weapon = true;
        return this;
    }


    private Item setAbout ( TextAsset about ) {
        this.about = about;
        return this;
    }


    private Item setIMG ( IMG imageID ) {
        this.imageID = imageID;
        return this;
    }


    public ModelAsset getModelAsset () {
        return modelAsset;
    }


    public String getName () {
        return name.get();
    }


    public String getAbout () {
        return about.get();
    }


    public Image getImage ( final float width, final float height ) {
        return imageID.getImageActor( width, height );
    }
}
