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

  static Future<void> reduceMortalSpeedInRoom(Haunting_Effect effect, List<Haunting_Mortal> mortalsInRoom, Haunting_Game game, double speedModifier, Haunting_Room room) async {
    for(Haunting_Mortal mortal in mortalsInRoom){
      // doTimerAction(mortal, effect,
      //   restartFunction: () {
      //     mortal.speedMultipliers.remove(speedModifier);
      //   },
      //   effectFunction: () {
      //     mortal.speedMultipliers.add(speedModifier);
      //   }
      // );


      print("SPRAWDZAM MORTALA ${mortal.name}");
      if(!mortal.effects.any((element) => element.power == effect.power)){
        print("MORTALA ${mortal.name} NIE MA EFEKTU -> TWORZENIE");
        Haunting_MortalEffect mortalEffect = Haunting_MortalEffect(power: effect.power!, mortal: mortal)
          ..room = room
          ..timeLeft = effect.timeLeft;
        effect.game.add(mortalEffect);
        mortal.effects.add(mortalEffect);
        MortalEffect_Navigator.navigateMortalEffect(mortalEffect);
      }

      // doTimerAction(mortal, effect,
      //   restartFunction: () {
      //     mortal.speed = Mortal_StaticData.getMortalSpeedByState(mortal.state, game);
      //   },
      //   effectFunction: () {
      //     mortal.speed = Mortal_StaticData.getMortalSpeedByState(mortal.state, game) * (1 -(speedReductionInPercents / 100));
      //   }
      // );

      // bool mortalHasEffectAlready = false;
      // for(Haunting_MortalEffect mortalEffect in mortal.effects){
      //   if(mortalEffect.power == effect.power){
      //     mortalHasEffectAlready = true;
      //     break;
      //   }
      // }
      // if(mortalHasEffectAlready == false){
      //   mortal.effects.add(Haunting_MortalEffect(power: effect.power!, mortal: mortal)..timeLeft = effect.timeLeft..room = room);
      // }

      // double value = speedReductionInPercents / 100;
      // mortal.speedMultiplier -= value;
      // await Future.delayed(const Duration(seconds: 1));
      // mortal.speedMultiplier += value;

      // if(effect.timeLeft <= 1){
      //   mortal.speedMultiplier ;
      // } else {
      //   print("${Mortal_StaticData.getMortalSpeedByState(mortal.state, game)} / (0 / ${speedReductionInPercents} = ${Mortal_StaticData.getMortalSpeedByState(mortal.state, game) / (100 - speedReductionInPercents)})");
      //   mortal.speed = Mortal_StaticData.getMortalSpeedByState(mortal.state, game) * (1 -(speedReductionInPercents / 100));
      // }
    }
  }

}