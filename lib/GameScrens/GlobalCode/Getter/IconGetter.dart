import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';

import '../../Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';

class IconGetter{
  static String getGhostIcon(Haunting_Ghost ghost) {
    return "assets/images/Ghosts/${ghost.icon}.png";
  }

  static String getPowerIcon(power) {
    return "assets/images/Powers/${power.icon}.png";
  }

  static String getMortalIcon(Haunting_Mortal mortal) {
    return "assets/images/Mortals/${mortal.icon}.png";
  }

  static String getUnknownIcon() {
    return "assets/images/UI/Icons/QuestionMark.png";
  }

}