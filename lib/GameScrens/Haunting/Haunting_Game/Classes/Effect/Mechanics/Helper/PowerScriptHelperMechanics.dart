import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';

import '../../../Power/Getter/PowerGetter.dart';
import '../../../Power/Haunting_Power.dart';
import '../../../Power/Mechanics/DealingDamage/DealingDamage.dart';

class PowerScriptHelperMechanics{
  static void dealDamageAsBuff(Haunting_Room? room, String id, Haunting_Power power, List<Haunting_Mortal> mortals) {
    if(room != null){
      Haunting_Power? neededPower = PowerGetter.getPowerById(id, power.game.level);
      if(neededPower != null) {
        for(var effect in room.effects){
          if(effect.power != null){
            if(effect.power!.id == neededPower.id){
              double buff = (effect.power!.powerChances) / 100;
              DealingDamage.dealDamageToAllMortals(power, mortals, power.game, buffModifier: buff);
              break;
            }
          }
        }
      }
    }
  }

}