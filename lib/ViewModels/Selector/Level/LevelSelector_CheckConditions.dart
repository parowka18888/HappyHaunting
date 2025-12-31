import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/03_Level.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseGhost_Getter.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import 'package:hive/hive.dart';

class LevelSelector_CheckConditions{
  static bool checkIfGhostCanBeAddedToTeam(Ghost? chosenGhost, LevelSelector_ViewModel levelViewModel) {
    Level? level = levelViewModel.chosenLevel;
    List<Ghost> chosenTeam = levelViewModel.chosenTeam;
    bool isMultipliedGhostsModeOn = levelViewModel.isMultipliedGhostsModeOn;

    if(level == null || chosenGhost == null) return false;

    if(chosenTeam.length < level.ghostsNumber){
      if(isMultipliedGhostsModeOn){
        return true;
      } else {
        if(chosenTeam.contains(chosenGhost)){
          return false;
        } else {
          return true;
        }
      }
    }
    return false;
  }

  static bool checkIfGhostIsInTeam(Ghost? chosenGhost, LevelSelector_ViewModel levelSelector_ViewModel) {
    if(chosenGhost != null){
      if(levelSelector_ViewModel.chosenTeam.contains(chosenGhost)){
        return false;
      } else {
        return true;
      }
    }
    return false;
  }

  static bool checkIfTeamIsFinal(LevelSelector_ViewModel levelSelector_ViewModel) {
    Level? level = levelSelector_ViewModel.chosenLevel;
    List<Ghost> chosenTeam = levelSelector_ViewModel.chosenTeam;
    
    if(level != null){
      if(chosenTeam.length >= level.ghostsNumber) return true;
    }

    List<Ghost> ownedGhosts = DatabaseGhost_Getter.getOwnedGhosts();
    if(chosenTeam.length >= ownedGhosts.length) return true;
    
    return false;
    
    
  }

}