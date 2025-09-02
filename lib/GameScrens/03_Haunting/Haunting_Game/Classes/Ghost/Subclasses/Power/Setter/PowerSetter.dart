import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Checker/Power_CheckConditions.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class PowerSetter{
  static void togglePowerActivation(Haunting_Power power, {
  Haunting_Game? game
  }) {
    power.isActivated = !power.isActivated;
    if(game != null){
      Power_CheckConditions.checkPossessionState(power, game);
    }
  }

  static void setPowerActivation(Haunting_Power power, bool value){
    power.isActivated = value;
  }

}