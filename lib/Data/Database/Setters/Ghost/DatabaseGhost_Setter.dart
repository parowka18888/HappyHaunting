import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/Getter/GhostTier_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';
import 'package:hive/hive.dart';

class DatabaseGhost_Setter{
  static Box box_Ghosts = Hive.box<Ghost>('ghosts');

  static void upgradeGhost(Ghost? ghost) {
    if(ghost != null){
      GhostTier? nextTier = GhostTier_Getter.getNextGhostTier(ghost.tier);
      if(nextTier != null){
        ghost.tier = nextTier;
        ghost.save();
      }
    }
  }

}
