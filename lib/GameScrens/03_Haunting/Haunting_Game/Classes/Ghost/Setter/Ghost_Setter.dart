import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';

class Ghost_Setter{
  static void setIsScriptExecuted(Haunting_Ghost ghost, bool bool) {
    ghost.isScriptExecuted = bool;
  }

  static void setIsFree(Haunting_Ghost ghost, bool bool) {
    ghost.isFree = true;
  }

  static void setIsDefeatable(Haunting_Ghost ghost, bool bool) {
    ghost.isDefeatable = bool;
  }

}