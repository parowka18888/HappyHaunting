import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/PowerScript/PowerScript.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';

import '../../../Power/Mechanics/DealingDamage/DealingDamage.dart';

class MortalEffect_Navigator{

  static void navigateMortalEffect(Haunting_MortalEffect effect) {
    PowerScript? script = effect.power.script;
    if(script != null){
      Haunting_Power power = effect.power;
      Haunting_Mortal mortal = effect.mortal;

      switch (script){
        case PowerScript.damage:{
          DealingDamage.dealDamageToAllMortals(power, [mortal], effect.game);
          break;
        }
      }
    }
  }

}