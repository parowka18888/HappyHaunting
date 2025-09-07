import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';

import '../Setter/Mortal_Setter.dart';

class Mortal_Behavior {
  static void freeMortalOfCurrentAction(Haunting_Mortal mortal) {
    Mortal_Setter.setTimeOfThinking(mortal, 0, canMove: true);
  }

}