import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mechanics/PowerScriptMechanics.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mechanics/RoomEffectMechanics.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Room/Haunting_Effect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';

import '../../../../../../Data/Database/Enums/Haunting/Scripts/PowerScript/PowerScript.dart';
import '../../Mortal/Haunting_Mortal.dart';

class PowerScript_Navigator{

  static void navigatePowerScript(Haunting_Power power, List<Haunting_Mortal> mortals, Haunting_Ghost ghost) {
    PowerScript? script = power.script;
    if(script != null){
      switch (script){
        case PowerScript.damage_fireElementalBuff: {
          PowerScriptMechanics.fireElementalBuff(power, mortals, ghost);
          break;
        }
        case PowerScript.damage_Spark_ChainEffect: {
          for(var mortal in mortals){
            PowerScriptMechanics.spark_ChainEffect(power, mortal, null);
          }
          break;
        }
        case PowerScript.damage_Mirror_3Powers:
          {
            PowerScriptMechanics.mirror_3Powers(power, mortals[0], ghost);
            break;
          }
      //UNAVAILABLE FOR MORTAL (FOR NOW)
        case PowerScript.damage: break;
        case PowerScript.damage_blockingMovement: break;
        case PowerScript.damage_ReducingMovement: break;
        case PowerScript.damage_Whisperer_Intruder: break;
        case PowerScript.damage_Moth_Darkness: break;
        case PowerScript.damage_ClothesEater_BonApetit: break;
        case PowerScript.damage_Mirror_ExorcistsBuff: break;
        case PowerScript.damage_FlyBuff: break;
      }
    }
  }

}