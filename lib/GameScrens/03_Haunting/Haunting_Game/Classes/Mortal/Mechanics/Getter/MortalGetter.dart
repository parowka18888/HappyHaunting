import 'dart:math';

import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

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

}