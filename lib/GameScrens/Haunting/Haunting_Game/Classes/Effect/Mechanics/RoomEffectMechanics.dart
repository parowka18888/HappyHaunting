import 'dart:async';

import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Mechanics/MortalEffect_Navigator.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Room/Haunting_Effect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/StaticData/Mortal_StaticData.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

class RoomEffectsMechanics{

  static void doTimerAction(Haunting_Mortal mortal, Haunting_Effect effect, {
    required Function() restartFunction,
    required Function() effectFunction,
  }) async {
    int seconds = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {

      if(seconds >= 1) timer.cancel();
      //USUŃ JEŚLI MORTAL JEST POZA ROOM
      if(!effect.room!.mortalsInRoom.contains(mortal) || effect.timeLeft <= 1){
        restartFunction();
        timer.cancel();
      } else {
        effectFunction();
      }
      seconds++;
      print('Minęła $seconds sekunda dla mortala ${mortal.name}');
      }
    );
  }


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