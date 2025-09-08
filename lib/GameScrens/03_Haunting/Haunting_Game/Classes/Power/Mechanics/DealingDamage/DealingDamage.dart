import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/CheckConditions/MortalChecker.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/PickUp/Mechanics/PickUp_Mechanics.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../Haunting_Power.dart';
import '../../Particles/ParticleDamage.dart';
import '../../Particles/PowerParticle.dart';

class DealingDamage{
  static List<double> dealInstantDamageToMortal(Haunting_Power power, Haunting_Mortal mortal, Haunting_Game game) {
    if(MortalChecker.checkIfMortalIsTargetable(mortal)){
      double modifier = 1;

      PickUp_Mechanics.leftPickUp(mortal, game);

      if(power.powerTags.contains(mortal.fear)){
        Mortal_Setter.setIsFearUnlocked(mortal, true);
        modifier = 1.25;
      }
      double damageFear = double.parse((power.stat_Fear * mortal.stat_Multiplier_Fear * modifier).toStringAsFixed(2));
      double damageHealth = double.parse((power.stat_Health * mortal.stat_Multiplier_Health * modifier).toStringAsFixed(2));
      double damageMadness = double.parse((power.stat_Madness * mortal.stat_Multiplier_Madness * modifier).toStringAsFixed(2));
      double damageFaith = double.parse((power.stat_Faith * mortal.stat_Multiplier_Faith * modifier).toStringAsFixed(2));

      if(damageFear > 0) PowerParticle.damagePower(Vector2(0, 0), mortal, Colors.red);
      if(damageHealth > 0) PowerParticle.damagePower(Vector2(0, 0), mortal, Colors.green);
      if(damageMadness > 0) PowerParticle.damagePower(Vector2(0, 0), mortal, Colors.amber);
      if(damageFaith > 0) PowerParticle.damagePower(Vector2(0, 0), mortal, Colors.blue);

      mortal.stat_Current_Fear += damageFear;
      mortal.stat_Current_Health += damageHealth;
      mortal.stat_Current_Madness += damageMadness;
      mortal.stat_Current_Faith += damageFaith;

      MortalChecker.checkIfMortalIsDefeated(mortal, game);
      return [damageFear, damageHealth, damageMadness, damageFaith];
    }
    return [0,0,0,0];
  }

  static void dealDamageToAllMortals(Haunting_Power power, List<Haunting_Mortal> mortals, Haunting_Game game, ){
    for(var mortal in mortals){
      dealInstantDamageToMortal(power, mortal, game);
    }
  }

}