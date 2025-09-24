import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Behavior/Mortal_Behavior.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

import '../../Movement/Destination/CheckDestination/Destination_Checker.dart';
import '../Mortal_Behavior_Checker.dart';

class MortalBehavior_Scare{

  static void scareMortalBehavior(Haunting_Mortal mortal, Haunting_Power power, Haunting_Game game) {

    //CHANGING MORTAL BEHAVIOR BY POWER STRENGTH
    bool shouldMortalBeScared = Mortal_Behavior_Checker.checkIfMortalShouldBeFreeFromAction_ByPower(mortal, power);
    mortalScare_ByChecker(mortal, game, shouldMortalBeScared);

    //CHANGING MORTAL BEHAVIOR BY STATE
    shouldMortalBeScared = Mortal_Behavior_Checker.checkIfMortalShouldBeFreeFromAction_ByState(mortal);
    mortalScare_ByChecker(mortal, game, shouldMortalBeScared);

  }

  static void mortalScare_ByChecker(Haunting_Mortal mortal, Haunting_Game game, bool shouldMortalBeScared) {
    if(shouldMortalBeScared){
      if(!Destination_Checker.checkIfMortalGoesToStairs(mortal, game)){
        Mortal_Behavior.scareMortal(mortal, game);
        return;
      }
    }
  }

}