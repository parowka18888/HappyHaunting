import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';

class TierModifier_Getter{
  static double getTierModifier_Damage(GhostTier tier) {
    switch(tier){
      case GhostTier.tier1:
        return 100;
      case GhostTier.tier2:
        return 125;
      case GhostTier.tier3:
        return 175;
      case GhostTier.tier4:
        return 225;
      case GhostTier.tier5:
        return 300;
      default: return 100;
    }
  }

  static double getTierModifier_Health(GhostTier tier) {
    switch(tier){
      case GhostTier.tier1:
        return 100;
      case GhostTier.tier2:
        return 115;
      case GhostTier.tier3:
        return 130;
      case GhostTier.tier4:
        return 145;
      case GhostTier.tier5:
        return 160;
      default: return 100;
    }
  }

  static double getTierModifier_Chance(GhostTier tier) {
    switch(tier){
      case GhostTier.tier1:
        return 100;
      case GhostTier.tier2:
        return 110;
      case GhostTier.tier3:
        return 120;
      case GhostTier.tier4:
        return 130;
      case GhostTier.tier5:
        return 140;
      default: return 100;
    }
  }

  static double getTierModifier_TimeOfPower(GhostTier tier) {
    switch(tier){
      case GhostTier.tier1:
        return 100;
      case GhostTier.tier2:
        return 110;
      case GhostTier.tier3:
        return 120;
      case GhostTier.tier4:
        return 130;
      case GhostTier.tier5:
        return 150;
      default: return 100;
    }
  }

}