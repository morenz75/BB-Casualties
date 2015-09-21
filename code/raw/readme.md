# Getting started
            
I'm a big fan of Blood Bowl, a fantasy football tablegame made by Games Workshop, so I'd like to point out some probabilities on one of the main action of the game, Blocks.

As in a normal American football matches defender can stop the attacker blocking it, and in Bloodbowl it is resolved with some dice roll, and here we focus only on the probabilities to injury the enemy.

Assuming that the defender is Knocked down, the  coach rolls two D6 and adds their scores together in an attempt to try to beat the Knocked Down player's Armour value. 
If the roll succeeds, then the coach is allowed to roll on the Injury table:

* 2-7, Stunned
* 8-9, KO
* 10-12, Casualty

Please consider that you can kill a player rolling a 6 on a single D6 dice, if you have previously scored a casualty!

Consider that there should be some modifier to apply on Armour and Injury Roll:

* Claw, break armour with 8+ if armpur is more that 7,
* Mighty Blow, you can add 1 to armour or injury roll,
* Niggling/Stunty, add 1 to injury roll.


Probabilities are calculated in this way:

* without Mighty Blow, Pr(Armour roll > Armour)\*Pr(Injuery roll > 9)
* with Mighty Blow, Pr(Armour roll+1 > Armour)\*Pr(Injuery roll > 9) + Pr(Armour roll > Armour)\*Pr(Injuery roll+1 > 9).


You can find complete Blood Bowl's rulebook here:
http://www.thenaf.net/blood-bowl/rules/