import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';

class DealingDamage{
  static List<double> dealInstantDamageToMortal(Haunting_Power power, Haunting_Mortal mortal) {
    double damageFear = double.parse((power.stat_Fear * mortal.stat_Multiplier_Fear).toStringAsFixed(2));
    double damageHealth = double.parse((power.stat_Health * mortal.stat_Multiplier_Health).toStringAsFixed(2));
    double damageMadness = double.parse((power.stat_Madness * mortal.stat_Multiplier_Madness).toStringAsFixed(2));
    double damageFaith = double.parse((power.stat_Faith * mortal.stat_Multiplier_Faith).toStringAsFixed(2));

    mortal.stat_Current_Fear += damageFear;
    mortal.stat_Current_Health += damageHealth;
    mortal.stat_Current_Madness += damageMadness;
    mortal.stat_Current_Faith += damageFaith;

    return [damageFear, damageHealth, damageMadness, damageFaith];
  }

}