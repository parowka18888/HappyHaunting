import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';

class GhostTier_Getter{
  static GhostTier? getNextGhostTier(GhostTier currentTier) {
    switch(currentTier){
      case GhostTier.tier1:
        return GhostTier.tier2;
      case GhostTier.tier2:
        return GhostTier.tier3;
      case GhostTier.tier3:
        return GhostTier.tier4;
      case GhostTier.tier4:
        return GhostTier.tier5;
      case GhostTier.tier5:
        return null;
    }
  }

}