import 'package:happyhaunting/Data/Database/Enums/Tier/Getter/GhostTier_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Settings/Tiers/TierModifier_Getter.dart';

class TierStats_Getter{
  static int getUpgradedValue_Damage(int value, GhostTier tier) {
    double modifier = TierModifier_Getter.getTierModifier_Damage(tier);
    modifier = modifier / 100;
    int upgradedValue = (value * modifier).round();
    return upgradedValue;
  }

  static int getUpgradedValue_PowerTime(double value, GhostTier tier) {
    double modifier = TierModifier_Getter.getTierModifier_TimeOfPower(tier);
    modifier = modifier / 100;
    int upgradedValue = (value * modifier).round();
    return upgradedValue;
  }

  static getUpgradedValue_Health(double value, GhostTier tier) {
    double modifier = TierModifier_Getter.getTierModifier_Health(tier);
    modifier = modifier / 100;
    int upgradedValue = (value * modifier).round();
    return upgradedValue;
  }

  static getUpgradedValue_Chance(double value, GhostTier tier) {
    double modifier = TierModifier_Getter.getTierModifier_Chance(tier);
    modifier = modifier / 100;
    int upgradedValue = (value * modifier).round();
    return upgradedValue;
  }

}