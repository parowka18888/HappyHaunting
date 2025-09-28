import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/CheckDestination/Destination_Checker.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Setter/InteractiveObject_Setter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../../../../../Data/Database/DatabaseStructure/02_Mortal.dart';
import '../../../Room/Haunting_Room.dart';

class MortalGetter{
  static Haunting_Mortal? getMortalByName(String name, Haunting_Game game) {
    for(Haunting_Mortal mortal in game.level.mortals){
      if(mortal.name == name) return mortal;
    }
    return null;
  }

  static int getThinkingTime(Haunting_Mortal mortal, Haunting_Game game) {
    for(final interactiveObject in mortal.floor!.listInteractiveObjects){
      Vector2 interactiveObject_Position = interactiveObject.position;
      bool isMortalAtObjectPosition = Destination_Checker.checkIfMortalReachedDestination_ByVector(mortal, interactiveObject_Position);
      if(isMortalAtObjectPosition){
        Mortal_Setter.setTimeOfThinking(mortal, interactiveObject.time);
        return interactiveObject.time.toInt();
      }
    }
    int bottomNumberOfSeconds = 2;
    int topNumberOfSeconds = 2;
    Random random = Random();
    var time = bottomNumberOfSeconds + random.nextInt(topNumberOfSeconds);
    Mortal_Setter.setTimeOfThinking(mortal, time.toDouble());
    return time;
  }

  static Mortal? getMortalById_TypeMortal(String mortalID, Haunting_Game game) {
    for(var mortal in game.mortals){
      if(mortal.id == mortalID) return mortal;
    }
    return null;
  }

  static Haunting_Mortal? getMortalByVector(Haunting_Game game, NotifyingVector2 position, {
    Haunting_Room? room
  }) {
    List<Haunting_Mortal> lisOfMortals = game.level.mortals;
    if(room != null) lisOfMortals = room.mortalsInRoom;

    for(final mortal in lisOfMortals){
      if(Destination_Checker.checkIfMortalReachedDestination_ByVector(mortal, position)){
        return mortal;
      }
    }
    return null;
  }

}