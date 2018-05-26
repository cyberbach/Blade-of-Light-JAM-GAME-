package net.overmy.bladeoflight.ashley.component;


/*
      Created by Andrey Mikheev on 16.03.2018
      Contact me → http://vk.com/id17317
 */

import net.overmy.bladeoflight.logic.Item;

public class DoorComponent extends ItemComponent {
    public float startAngle;
    public float endAngle;
    public float currentAngle;


    public DoorComponent ( Item itemForOpenDoor, float startAngle, float endAngle ) {
        super( itemForOpenDoor );

        this.startAngle = startAngle;
        this.currentAngle = startAngle;
        this.endAngle = endAngle;
    }
}
