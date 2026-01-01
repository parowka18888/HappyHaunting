import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';

import '../../Mortal/StaticData/Mortal_StaticData.dart';

class MortalEffectMechanics{

  static void setMortalSpeed(Haunting_Mortal mortal, Haunting_MortalEffect effect, int speed) {
    mortal.speed = 0;
    if(effect.timeLeft <= 1) {
      mortal.speed = Mortal_StaticData.getMortalSpeedByState(mortal.state, effect.game);
    }
  }

  static void reduceMortalSpeedByPercentageValue(Haunting_Mortal mortal, Haunting_MortalEffect effect, int percentageValue) {
    if(effect.timeLeft <= 1 || !effect.room!.contains(mortal)){
      mortal.speed = Mortal_StaticData.getMortalSpeedByState(mortal.state, effect.game);
    } else {
      // mortal.speed = Mortal_StaticData.getMortalSpeedByState(mortal.state, effect.game) * (1 -(percentageValue / 100));
      mortal.speed = 100;
    }

  }

}