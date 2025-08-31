import 'dart:math';

import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../../../../../Data/Database/DatabaseStructure/02_Mortal.dart';

class MortalGetter{
  static Haunting_Mortal? getMortalByName(String name, Haunting_Game game) {
    for(Haunting_Mortal mortal in game.level.mortals){
      if(mortal.name == name) return mortal;
    }
    return null;
  }

  static int getThinkingTime() {
    int bottomNumberOfSeconds = 2;
    int topNumberOfSeconds = 2;
    Random random = Random();
    return bottomNumberOfSeconds + random.nextInt(topNumberOfSeconds);
  }

  static Mortal? getMortalById_TypeMortal(String mortalID, Haunting_Game game) {
    for(var mortal in game.mortals){
      if(mortal.id == mortalID) return mortal;
    }
    return null;
  }

}