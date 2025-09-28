import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/Enums/Resource/Resource.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/Getter/GhostTier_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';

import '../../../DatabaseStructure/01_Power.dart';

class UpgradePrice_Getter{
  static int getUpgradePrice(Resource resource, Ghost ghost) {

    GhostTier? nextTier = GhostTier_Getter.getNextGhostTier(ghost.tier);
    if(nextTier == null) return 0;

    int priceMultiplier = UpgradePrice_Getter.getPriceMultiplier(nextTier);

    bool Function(Power) statCondition;
    switch (resource) {
      case Resource.fear:
        statCondition = (power) => power.stat_Fear > 0;
        break;
      case Resource.health:
        statCondition = (power) => power.stat_Health > 0;
        break;
      case Resource.faith:
        statCondition = (power) => power.stat_Health > 0;
        break;
      case Resource.madness:
        statCondition = (power) => power.stat_Madness > 0;
        break;
      case Resource.emotions:
        statCondition = (power) => power.stat_Emotions > 0;
        break;
      case Resource.impurity:
        statCondition = (power) => power.stat_Impurity > 0;
        break;
      case Resource.gold:
        return (100 * priceMultiplier).toInt();
        statCondition = (power) => power.stat_Impurity > 0;
        break;
    }

    final count = (ghost.powers.where(statCondition).length * priceMultiplier).toInt();
    return count;
  }

  static int getPriceMultiplier(GhostTier nextTier) {
    switch(nextTier){
      case GhostTier.tier1:
        return 0;
      case GhostTier.tier2:
        return 2;
      case GhostTier.tier3:
        return 4;
      case GhostTier.tier4:
        return 6;
      case GhostTier.tier5:
        return 8;
    }
  }


}