import 'package:happyhaunting/Data/Database/Enums/Mortal_State.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Behavior/Mortal_Behavior_Checker.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/CheckConditions/MortalChecker.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/CheckDestination/Destination_Checker.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Navigator.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

import '../Setter/Mortal_Setter.dart';

class Mortal_Behavior {
  static void freeMortalOfThinkingTime(Haunting_Mortal mortal) {
    Mortal_Setter.setTimeOfThinking(mortal, 0, canMove: true);
  }

  static void scareMortal(Haunting_Mortal mortal, Haunting_Game game){
    freeMortalOfThinkingTime(mortal);
    Mortal_Destination_Navigator.setMortalNextDestination_Navigator(mortal, game);
    Mortal_Setter.setState(mortal, Mortal_State.terrified);
  }


}