import 'dart:math';

import 'package:happyhaunting/Data/Database/Enums/Mortal_State.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';

class Mortal_Behavior_Checker{

  static Random random = Random();

  static bool checkIfMortalShouldBeFreeFromAction_ByState(Haunting_Mortal mortal) {
    bool shouldMortalBeFreedFromAction = false;
    switch (mortal.state){
      case Mortal_State.calm:
        break;
      case Mortal_State.scared:
        double chanceForFreeing = 0.75;
        double r = random.nextDouble();
        if(r < chanceForFreeing){
          shouldMortalBeFreedFromAction = true;
        }
        break;
      case Mortal_State.terrified:
        shouldMortalBeFreedFromAction = true;
        break;
    }
    return shouldMortalBeFreedFromAction;
  }

  static bool checkIfMortalShouldBeFreeFromAction_ByPower(Haunting_Mortal mortal, Haunting_Power power) {
    if(power.powerTags.contains(mortal.fear)){
      return true;
    }
    return false;
  }

}