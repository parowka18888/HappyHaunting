import 'package:happyhaunting/Data/Database/Enums/Mortal_State.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

class Mortal_StaticData{
  static double getMortalSpeedByState(Mortal_State state, Haunting_Game game) {
    var levelHeight = game.height; //880, 2176, 4352
    double modifier = 17.6;

    switch (state) {
      case Mortal_State.calm:
        modifier = 17.6;
        break;
      case Mortal_State.scared:
        modifier = 11.7;
        break;
      case Mortal_State.terrified:
        modifier = 8.8;
        break;
    }
    return levelHeight / modifier; //50, 75, 100

  }

  static double getChanceForChangingFloor_ByState(Mortal_State state) {
    switch (state) {
      case Mortal_State.calm:
        return 0.10;
      case Mortal_State.scared:
        return 0.15;
      case Mortal_State.terrified:
        return 0.25;
    }
  }

  static double getChanceForInteractiveObject_ByState(Mortal_State state) {
    switch (state) {
      case Mortal_State.calm:
        return 0.4;
      case Mortal_State.scared:
        return 0.15;
      case Mortal_State.terrified:
        return 0.05;
    }
  }

  static double getChanceForSeducingObject_ByState(Mortal_State state) {
    switch (state) {
      default: return 1;
    }
  }

}