import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Effect/Haunting_Effect.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../../../../../Entry/Haunting_Entry.dart';
import '../../../PowerMechanics.dart';

class PowersEffect{

  static void usePower_EffectRoom(Haunting_Power power, Haunting_Ghost ghost, Haunting_Room room, Haunting_Game game) {
    Haunting_Effect? effect;
    for(var roomEffect in room.effects){
      if(roomEffect.power == null){
        effect = roomEffect;
        break;
      } else {
        print(roomEffect.power!.icon);
      }
    }
    if(effect != null){
      effect.power = power;
      effect.timeLeft = power.powerTime;
      PowerMechanics.usePower_EndingProcess(game, power, ghost, room);
    }
  }

}