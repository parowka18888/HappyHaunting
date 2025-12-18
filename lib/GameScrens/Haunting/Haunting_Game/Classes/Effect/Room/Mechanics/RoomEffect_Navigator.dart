import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Room/Haunting_Effect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';

import '../../../../../../../Data/Database/Enums/Haunting/Scripts/PowerScript/PowerScript.dart';
import '../../../Mortal/Haunting_Mortal.dart';
import '../../../Power/Haunting_Power.dart';
import '../../../Power/Mechanics/DealingDamage/DealingDamage.dart';

class RoomEffect_Navigator{

  static void navigateMortalEffect(Haunting_Effect effect) {
    PowerScript? script = effect.power?.script;
    Haunting_Power? power = effect.power;
    Haunting_Room? room = effect.room;

    if(script != null && power != null && room != null){
      switch (script){
        case PowerScript.damage:{
          DealingDamage.dealDamageToAllMortals(power, room.mortalsInRoom, effect.game);
          break;
        }
      }
    }
  }

}