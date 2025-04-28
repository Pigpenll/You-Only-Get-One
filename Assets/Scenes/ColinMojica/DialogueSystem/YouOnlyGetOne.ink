VAR plantWatered = false
VAR daughterFed = true
VAR visitorMet = false
VAR manHelped = false

-> monday

=== monday ===
You find a fragile green sprout in the barren wasteland.
    * Scoop it up carefully
        You bring it home.

-> monday_morning

=== monday_morning ===
Your daughter gasps at the plant.
"Daddy! It's real! It's a real plant!"
"We have to protect it!"

* Water the plant
    ~ plantWatered = true
    -> monday_evening
* Don't water the plant
    ~ plantWatered = false
    -> monday_evening

=== monday_evening ===
Later that night, you discover the water supply has been stolen.
Only a few bottles remain.

{plantWatered:
    You skip dinner to save supplies.
    ~ daughterFed = false
}
{plantWatered == false:
    You and your daughter eat a small dinner.
    ~ daughterFed = true
}
-> tuesday

=== tuesday ===
You wake up. The plant has grown another leaf.

Daughter: "Daddy! Can I water it today?"

* Let her water it
    ~ plantWatered = true
    -> tuesday_door
* Say no
    ~ plantWatered = false
    -> tuesday_door

=== tuesday_door ===
A knock at the door.

* Open the door
    A robed figure hands you a pamphlet.
    "Two weeks... God is coming..."
    ~ visitorMet = true
    -> tuesday_evening
* Ignore the knock
    You wait silently. The figure moves on.
    -> tuesday_evening

=== tuesday_evening ===
Dinner time.

* Skip dinner to save water
    You go hungry.
    ~ daughterFed = false
    -> wednesday
* Eat dinner
    You prepare a small meal.
    ~ daughterFed = true
    -> wednesday

=== wednesday ===
Morning comes.

{plantWatered:
    The plant is thriving.
    Daughter smiles: "Maybe there's still hope!"
}
{plantWatered == false:
    The plant looks weak.
    Daughter frowns: "It looks sick..."
}

Daughter demands to water the plant.

* Water the plant
    ~ plantWatered = true
    -> wednesday_door
* Save water
    ~ plantWatered = false
    -> wednesday_door

=== wednesday_door ===
Another knock at the door.

* Open the door
    A desperate man threatens you.
    -> open_door_choices
== open_door_choices ==
    * Give him water
        You hand him a bottle.
        ~ manHelped = true
        -> wednesday_evening

    * Refuse
        You slam the door.
        ~ manHelped = false
        -> wednesday_evening

* Ignore the door
    Silence returns.
    -> wednesday_evening


=== wednesday_evening ===
Dinner decision again.

* Skip dinner
    Your stomach growls painfully.
    ~ daughterFed = false
    -> thursday
* Eat dinner
    You find enough for a small meal.
    ~ daughterFed = true
    -> thursday

=== thursday ===
Morning.

{daughterFed == false:
    Daughter is pale, shivering.
}
{daughterFed:
    Daughter watches the plant, smiling weakly.
}

{plantWatered:
    The plant now has a tiny bud.
}
{plantWatered == false:
    The plant droops lifelessly.
}

* Water the plant
    ~ plantWatered = true
    -> thursday_evening
* Save water
    ~ plantWatered = false
    -> thursday_evening

=== thursday_evening ===
Another night falls.

{visitorMet:
    You stare at the old pamphlet:
    "Two weeks. God is coming."
}
{visitorMet == false:
    The empty room presses in around you. No words. No hope.
}
Dinner decision:

* Skip dinner
    Hunger claws at you.
    ~ daughterFed = false
    -> friday
* Eat dinner
    You share a quiet meal.
    ~ daughterFed = true
    -> friday

=== friday ===
Morning. The final day.

{plantWatered == false:
    The plant is dead.
    Daughter weeps by its shriveled stem.
    Hope is lost.
    -> bad_ending
}

{plantWatered and daughterFed:
    The plant has grown a small glowing fruit.
    Daughter is tired but alive.
    Together, you plant the fruit in the earth.
    A green light blooms across the wasteland.
    -> good_ending
}
{plantWatered and daughterFed == false:
    You stumble outside alone.
    You plant the fruit. A single tree blooms... for no one.
    -> bittersweet_ending
}


=== good_ending ===
You kneel with your daughter in the dust.
Together, you press the glowing seed into the cracked earth.
For a moment, nothing.
Then — a surge of green, a breath of life.
She clutches your arm, tears streaking her dirtied face.
"Daddy... we did it."
The sun rises, and for the first time in years... it’s warm.

-> DONE

=== bittersweet_ending ===
You stand alone outside your broken home.
The glowing seed pulses weakly in your hands.
You kneel and plant it into the earth.
Slowly, a green vine unfurls, blossoming against the endless grey.
You smile faintly, but the house behind you is silent.
There is life again... but at a cost.

-> DONE

=== bad_ending ===
You find your daughter crumpled in the corner, her tiny arms wrapped around the dead plant.
The sapling's withered stem bends under the dry wind.
She whispers, "I thought we still had time..."
You sit beside her, unable to find words.
Outside, the world remains silent and dead.

-> DONE

