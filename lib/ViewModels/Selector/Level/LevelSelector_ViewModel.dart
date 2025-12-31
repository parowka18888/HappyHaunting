import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/03_Level.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/11_Expansion.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseGhost_Getter.dart';
import 'package:happyhaunting/Data/Database/Setters/Ghost/DatabaseGhost_Setter.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_CheckConditions.dart';

import '../../../Data/Database/DatabaseStructure/12_Chapter.dart';
import '../../../GameScrens/GlobalCode/GUI/Buttons/SpecialButtons/CancelButton/Mechanics/CancelButton_Mechanics.dart';

class LevelSelector_ViewModel extends ChangeNotifier {

  Expansion? chosenExpansion;
  Chapter? chosenChapter;
  Level? chosenLevel;
  Ghost? chosenTrappedGhost;
  List<Ghost> chosenTeam = [];

  bool isMultipliedGhostsModeOn = false;
  bool isHardModeOn = false;
  bool isSkipTrapsModeOn = false;

  void setChosenExpansion(Expansion? expansion) {
    chosenExpansion = expansion;
    notifyListeners();
  }

  void setChosenChapter(Chapter? chapter) {
    chosenChapter = chapter;
    notifyListeners();
  }

  void clear() {
    chosenExpansion = null;
    chosenChapter = null;
    chosenLevel = null;
    chosenTeam = [];
    isMultipliedGhostsModeOn = false;
    isSkipTrapsModeOn = false;
    isHardModeOn = false;
    chosenTrappedGhost = null;
    notifyListeners();
  }

  void setChosenLevel(Level level) {
    chosenLevel = level;
    notifyListeners();
  }

  popScreen(BuildContext context) {
    clear();
    CancelButton_Mechanics.popScreen(context);
    notifyListeners();
  }

  manageGhostInTeam(Ghost? chosenGhost) {
     bool canBeAdded = LevelSelector_CheckConditions.checkIfGhostCanBeAddedToTeam(chosenGhost, this);
     if(canBeAdded && chosenGhost != null){
       addGhost(chosenGhost);
     } else {
       removeGhost(chosenGhost);
     }
  }

  void addGhost(Ghost chosenGhost) {
    chosenTeam.add(chosenGhost);
    notifyListeners();
  }

  void removeGhost(Ghost? chosenGhost) {
    if(chosenTeam.contains(chosenGhost)){
      chosenTeam.remove(chosenGhost);
      notifyListeners();
    }
  }

  void toggleIsMultipliedGhostsMode() {
    if(chosenLevel?.isBeaten == true){
      isMultipliedGhostsModeOn = !isMultipliedGhostsModeOn;
    } else {
      isMultipliedGhostsModeOn = false;
    }
    notifyListeners();
  }

  void randomiseTeam() {
    List<Ghost> ownedGhosts = DatabaseGhost_Getter.getOwnedGhosts();
    chosenTeam = [];
    int ownedGhostsNumber = ownedGhosts.length;
    ownedGhosts.shuffle(Random());

    for(int i = 0; i < chosenLevel!.ghostsNumber; i++){
      if(ownedGhosts.length > 0){
        chosenTeam.add(ownedGhosts[0]);
        if(isMultipliedGhostsModeOn){
          ownedGhosts.shuffle(Random());
        } else {
          ownedGhosts.removeAt(0);
        }
      }
    }
    notifyListeners();
  }

  void clearTeam() {
    chosenTeam = [];
    notifyListeners();
  }

  void setChosenTrappedGhost(Ghost? ghost) {
    if(chosenTrappedGhost == ghost){
      chosenTrappedGhost = null;
    } else {
      chosenTrappedGhost = ghost;
    }
    notifyListeners();
  }

  void toggleHardMode() {
    if(chosenLevel?.isBeaten == true){
      isHardModeOn = !isHardModeOn;
    } else {
      isHardModeOn = false;
    }
    notifyListeners();
  }

  void toggleSkipTraps() {
    if(chosenLevel?.isBeaten == true){
      isSkipTrapsModeOn = !isSkipTrapsModeOn;
    } else {
      isSkipTrapsModeOn = false;
    }
    notifyListeners();
  }

}