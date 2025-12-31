import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/PowerScript/PowerScript.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mechanics/MortalEffectMechanics.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';

import '../../../Mortal/StaticData/Mortal_StaticData.dart';
import '../../../Power/Mechanics/DealingDamage/DealingDamage.dart';

class MortalEffect_Navigator{

  static void navigateMortalEffect(Haunting_MortalEffect effect) {
    PowerScript? script = effect.power.script;
    if(script != null){
      Haunting_Power power = effect.power;
      Haunting_Mortal mortal = effect.mortal;

      switch (script){
        case PowerScript.damage:{
          DealingDamage.dealInstantDamageToMortal(power, mortal, effect.game);
          break;
        }
        case PowerScript.damage_blockingMovement:{
          DealingDamage.dealInstantDamageToMortal(power, mortal, effect.game);
          MortalEffectMechanics.setMortalSpeed(mortal, effect, 0);
          break;
        }
        //UNAVAILABLE FOR MORTAL (FOR NOW)
        case PowerScript.damage_ReducingMovement_50:{
          DealingDamage.dealInstantDamageToMortal(power, mortal, effect.game);
          MortalEffectMechanics.reduceMortalSpeedByPercentageValue(mortal, effect, 50);
          break;
        }
        case PowerScript.damage_ReducingMovement_80:{
          DealingDamage.dealInstantDamageToMortal(power, mortal, effect.game);
          MortalEffectMechanics.reduceMortalSpeedByPercentageValue(mortal, effect, 50);
          break;
        }
      }
    }
  }

}