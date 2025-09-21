import 'package:flutter/cupertino.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';

class GhostSelector_ViewModel extends ChangeNotifier {

  Ghost? chosenGhost;

  void setChosenGhost(Ghost? ghost){
    chosenGhost = ghost;
    notifyListeners();
  }

}