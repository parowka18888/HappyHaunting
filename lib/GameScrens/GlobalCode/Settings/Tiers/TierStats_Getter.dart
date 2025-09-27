import 'package:happyhaunting/Data/Database/Enums/Tier/Getter/GhostTier_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Settings/Tiers/TierModifier_Getter.dart';

class TierStats_Getter{
  static double getUpgradedValue_Damage(int value, GhostTier tier) {
    double modifier = TierModifier_Getter.getTierModifier(tier);
    modifier = modifier / 100;
    double upgradedValue = value * modifier;
    return upgradedValue;
  }

  static double getUpgradedValue_PowerTime(double powerTime, GhostTier tier) {
    double modifier = TierModifier_Getter.getTierModifier(tier);
    return powerTime;
  }

}