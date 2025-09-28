import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';

class Tier_GUI{
  static String getTierImage(GhostTier tier) {
    switch(tier){
      case GhostTier.tier1: { return 'Tier1'; }
      case GhostTier.tier2: { return 'Tier2'; }
      case GhostTier.tier3: { return 'Tier3'; }
      case GhostTier.tier4: { return 'Tier4'; }
      case GhostTier.tier5: { return 'Tier5'; }
      default: {return 'Tier1';}
    }
  }

}