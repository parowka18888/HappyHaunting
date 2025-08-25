import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Haunting_Power.dart';

class PowerSetter{
  static void togglePowerActivation(Haunting_Power power) {
    power.isActivated = !power.isActivated;
  }

  static void setPowerActivation(Haunting_Power power, bool value){
    power.isActivated = value;
  }

}