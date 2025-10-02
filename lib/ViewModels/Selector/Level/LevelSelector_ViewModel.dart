import 'package:flutter/cupertino.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/03_Level.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/11_Expansion.dart';

import '../../../Data/Database/DatabaseStructure/12_Chapter.dart';

class LevelSelector_ViewModel extends ChangeNotifier {

  Expansion? chosenExpansion;
  Chapter? chosenChapter;
  Level? chosenLevel;

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
    notifyListeners();
  }

  void setChosenLevel(Level level) {
    chosenLevel = level;
    notifyListeners();
  }

}