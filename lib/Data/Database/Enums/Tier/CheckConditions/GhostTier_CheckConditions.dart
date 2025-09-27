import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';

class GhostTier_CheckConditions{

  static bool checkIfGhostIsTopTier(Ghost ghost) {
    if(ghost.tier == GhostTier.tier5) return true;
    return false;
  }

  static bool checkIfGhostReachedLevel(Ghost ghost, GhostTier tier) {
    return ghost.tier.index >= tier.index;
  }

}