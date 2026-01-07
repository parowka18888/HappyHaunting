import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/PowerScript/PowerScript.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mechanics/MortalEffectMechanics.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mechanics/PowerScriptMechanics.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Getter/GhostGetter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';

import '../../Mortal/StaticData/Mortal_StaticData.dart';
import '../../Power/Mechanics/DealingDamage/DealingDamage.dart';

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
          MortalEffectMechanics.reduceMortalSpeedByPercentageValue(mortal, effect, 100);
          // MortalEffectMechanics.setMortalSpeed(mortal, effect, 0);
          break;
        }
        case PowerScript.damage_ReducingMovement:{
          DealingDamage.dealInstantDamageToMortal(power, mortal, effect.game);
          MortalEffectMechanics.reduceMortalSpeedByPercentageValue(mortal, effect, power.powerChances);
          break;
        }
        case PowerScript.damage_Spark_ChainEffect:
          {
            DealingDamage.dealInstantDamageToMortal(power, mortal, effect.game);
            PowerScriptMechanics.spark_ChainEffect(power, mortal, effect);
            break;

          }
        case PowerScript.damage_Whisperer_Intruder:
          {
            Haunting_Room? room = mortal.room;
            if(room != null){
              DealingDamage.dealDamageToAllMortals(power, room.mortalsInRoom, power.game);
              MortalEffectMechanics.reduceMortalSpeedByPercentageValue(mortal, effect, -power.powerChances);

            }
          }
        case PowerScript.damage_ClothesEater_BonApetit: {
          DealingDamage.dealInstantDamageToMortal(power, mortal, power.game);
        }
        case PowerScript.damage_Mirror_ExorcistsBuff: {
          if(mortal.exorcismStrength > 0){
            double value = mortal.exorcismStrength;
            DealingDamage.dealInstantDamageToMortal(power, mortal, power.game, buffModifier: power.powerChances / 100,
                health: value, fear: value, faith: value, madness: value, impurity: value, emotions: value);
          }
          break;
        }
        //UNAVAILABLE FOR MORTAL (FOR NOW)
        case PowerScript.damage_fireElementalBuff: break;
        case PowerScript.damage_Moth_Darkness: break;
        case PowerScript.damage_Mirror_3Powers: break;
        case PowerScript.damage_FlyBuff: break;
      }
    }
  }

}