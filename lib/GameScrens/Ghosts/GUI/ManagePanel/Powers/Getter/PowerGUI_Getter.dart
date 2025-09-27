import 'package:happyhaunting/Data/Database/DatabaseStructure/01_Power.dart';

class PowerGUI_Getter{
  static double getStatItemCount(Power power) {
    double itemCount = 0;
    if(power.stat_Fear > 0) itemCount++;
    if(power.stat_Health > 0) itemCount++;
    if(power.stat_Faith > 0) itemCount++;
    if(power.stat_Emotions > 0) itemCount++;
    if(power.stat_Madness > 0) itemCount++;
    if(power.stat_Impurity > 0) itemCount++;
    return itemCount;
  }

}