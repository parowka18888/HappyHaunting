import 'package:flutter/cupertino.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/01_Power.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Statistic.dart';
import 'package:happyhaunting/Data/Database/Enums/Window/GhostSelector/GhostSelector_WindowMode.dart';

class GhostSelector_ViewModel extends ChangeNotifier {

  Ghost? chosenGhost;
  Power? chosenPower;
  List<Statistic> chosenGhostTypes = [];

  GhostSelector_WindowMode windowMode = GhostSelector_WindowMode.powers;

  void setChosenGhost(Ghost? ghost){
    chosenGhost = ghost;
    chosenPower = null;
    notifyListeners();
  }

  void setWindowMode(GhostSelector_WindowMode mode){
    windowMode = mode;
    notifyListeners();
  }

  void setChosenPower(Power? power) {
    chosenPower = power;
    notifyListeners();
  }

  void addGhostTypeToFilter(Statistic stat){
    if(!chosenGhostTypes.contains(stat)){
      chosenGhostTypes.add(stat);
    }
    notifyListeners();
  }

  void removeGhostTypeFromFilter(Statistic stat){
    if(chosenGhostTypes.contains(stat)){
      chosenGhostTypes.remove(stat);
    }
    notifyListeners();
  }

  void toggleFilter(Statistic stat) {
    if(chosenGhostTypes.contains(stat)){
      chosenGhostTypes.remove(stat);
    } else {
      chosenGhostTypes.add(stat);
    }
    notifyListeners();
  }

}