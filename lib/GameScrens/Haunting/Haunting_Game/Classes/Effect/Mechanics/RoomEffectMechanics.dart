import 'dart:async';

import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Navigators/MortalEffect_Navigator.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Room/Haunting_Effect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/StaticData/Mortal_StaticData.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

class RoomEffectsMechanics{

  static void addEffectToMortal(Haunting_Effect effect, Haunting_Room room) {
    for(Haunting_Mortal mortal in room.mortalsInRoom){
      if(!mortal.effects.any((element) => element.power == effect.power)){
        Haunting_MortalEffect mortalEffect = Haunting_MortalEffect(power: effect.power!, mortal: mortal)
          ..room = room
          ..timeLeft = effect.timeLeft - 1;
        effect.game.add(mortalEffect);
        mortal.effects.add(mortalEffect);
        MortalEffect_Navigator.navigateMortalEffect(mortalEffect);
      }
    }
  }

}