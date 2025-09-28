import 'package:happyhaunting/Data/Database/Checkers/Player/DatabasePlayer_CheckConditions.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/Enums/Resource/Getter/Resource_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Resource/Resource.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/Getter/UpgradePrice_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';

class GhostTier_CheckConditions{

  static bool checkIfGhostIsTopTier(Ghost ghost) {
    if(ghost.tier == GhostTier.tier5) return true;
    return false;
  }

  static bool checkIfGhostReachedLevel(Ghost ghost, GhostTier tier) {
    return ghost.tier.index >= tier.index;
  }

  static bool checkIfGhostCanBeUpgraded(Ghost ghost) {
    if(checkIfGhostIsTopTier(ghost)) return false;

    List<Resource> listOfResources = Resource.values;
    for(var resource in listOfResources){
      if(!DatabasePlayer_CheckConditions.checkIfPlayerCanAfford(UpgradePrice_Getter.getUpgradePrice(resource, ghost), resource)) return false;
    }
    return true;
  }

}