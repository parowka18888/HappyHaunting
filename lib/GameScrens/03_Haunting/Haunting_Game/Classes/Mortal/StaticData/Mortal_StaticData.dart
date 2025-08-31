import 'package:happyhaunting/Data/Database/Enums/Mortal_State.dart';

class Mortal_StaticData{
  static double getMortalSpeedByState(Mortal_State state) {
    switch (state) {
      case Mortal_State.calm:
        return 50;
        break;
      case Mortal_State.scared:
        return 75;
        break;
      case Mortal_State.terrified:
        return 100;
        break;
      case Mortal_State.hurt:
        return 50;
        break;
      case Mortal_State.dead:
        return 25;
        break;
    }
    return 50;
  }

}