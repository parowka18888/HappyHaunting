import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/01_Power.dart';

class PowerList_Getter{
  static double getScaledIconSize(double height, double width, double iconPadding, {
    int count = 4
  }) {
    double iconSize = height - iconPadding;
    double itemsTotalWidth = iconSize * count + iconPadding * (count - 1);
    if(itemsTotalWidth > width){
      double difference = itemsTotalWidth - width;
      iconSize -= difference / count;
      iconSize = iconSize > 0 ? iconSize : 0;
    }
    return iconSize;
  }

  static String getIconName(Power? power, Ghost? ghost, int index) {
    String icon = "";
    if(power == null){
      if(ghost != null && ghost.powers.length >= index){
        power = ghost.powers[index];
        icon = power.icon;
      } else {
        icon = "UnknownPower";
      }
    } else {
      icon = power.icon;
    }
    return icon;
  }


  static Power getPowerByIndex(Ghost? ghost, int index) {
    return ghost!.powers[index];
  }

}