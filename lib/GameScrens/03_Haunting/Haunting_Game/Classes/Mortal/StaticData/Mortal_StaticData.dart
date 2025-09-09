import 'package:happyhaunting/Data/Database/Enums/Mortal_State.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';

class Mortal_StaticData{
  static double getMortalSpeedByState(Mortal_State state) {
    switch (state) {
      case Mortal_State.calm:
        return 50;
      case Mortal_State.scared:
        return 75;
      case Mortal_State.terrified:
        return 100;
    }
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