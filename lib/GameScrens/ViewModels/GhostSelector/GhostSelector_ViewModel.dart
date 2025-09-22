import 'package:flutter/cupertino.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/01_Power.dart';
import 'package:happyhaunting/Data/Database/Enums/Window/GhostSelector/GhostSelector_WindowMode.dart';

class GhostSelector_ViewModel extends ChangeNotifier {

  Ghost? chosenGhost;
  Power? chosenPower;

  GhostSelector_WindowMode windowMode = GhostSelector_WindowMode.Abilities;

  void setChosenGhost(Ghost? ghost){
    chosenGhost = ghost;
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

}