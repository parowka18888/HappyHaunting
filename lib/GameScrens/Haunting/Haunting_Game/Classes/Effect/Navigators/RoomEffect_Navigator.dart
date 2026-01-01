import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mechanics/RoomEffectMechanics.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Room/Haunting_Effect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Getter/GhostGetter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Mechanics/Speed/SpeedModifying.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';

import '../../../../../../Data/Database/Enums/Haunting/Scripts/PowerScript/PowerScript.dart';
import '../../Mortal/Haunting_Mortal.dart';
import '../../Power/Haunting_Power.dart';
import '../../Power/Mechanics/DealingDamage/DealingDamage.dart';
import '../Mechanics/PowerScriptMechanics.dart';

class RoomEffect_Navigator{

  static void navigateRoomEffect(Haunting_Effect effect) {
    PowerScript? script = effect.power?.script;
    Haunting_Power? power = effect.power;
    Haunting_Room? room = effect.room;

    if(script != null && power != null && room != null){
      switch (script){
        case PowerScript.damage:{
          DealingDamage.dealDamageToAllMortals(power, room.mortalsInRoom, effect.game);
          break;
        }
        case PowerScript.damage_ReducingMovement:
          {
          RoomEffectsMechanics.addEffectToMortal(effect, room);
          break;
          }
        case PowerScript.damage_fireElementalBuff:
          {
            DealingDamage.dealDamageToAllMortals(power, room.mortalsInRoom, effect.game);
            Haunting_Ghost? ghost = GhostGetter.getGhostByPower(power, power.game);
            if(ghost != null) PowerScriptMechanics.fireElementalBuff(power, room.mortalsInRoom, ghost);
            break;
          }
        //UNAVAILABLE FOR ROOM (FOR NOW)
        case PowerScript.damage_blockingMovement: break;
      }
    }
  }

}