package net.overmy.bladeoflight.ashley.component;



/*
     Created by Andrey Mikheev on 20.04.2017
     Contact me → http://vk.com/id17317
 */

import net.overmy.bladeoflight.resources.TextAsset;

public class TextDecalComponent extends TimeComponent {

    public final TextAsset text;


    public TextDecalComponent ( TextAsset text, float time ) {
        this.text = text;
        this.time = time;
    }
}
