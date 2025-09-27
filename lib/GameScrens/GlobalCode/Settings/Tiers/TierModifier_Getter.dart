import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';

class TierModifier_Getter{
  static double getTierModifier(GhostTier tier) {
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
    }
  }

}