import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';

import '../../Mortal/StaticData/Mortal_StaticData.dart';

class MortalEffectMechanics{

  static void setMortalSpeed(Haunting_Mortal mortal, Haunting_MortalEffect effect, int speed) {
    mortal.speed = 0;
    if(effect.timeLeft <= 1) {
      mortal.speed = Mortal_StaticData.getMortalSpeedByState(mortal.state, effect.game);
    }
  }

  static void reduceMortalSpeedByPercentageValue(Haunting_Mortal mortal, Haunting_MortalEffect effect, double percentage) {

    double value = (percentage / 100);
    double multiplier = 1 - value;
    mortal.speedMultipliersMap[effect] = multiplier;

    if(effect.timeLeft <= 1){
      mortal.speedMultipliersMap.remove(effect);
    }
  }

}