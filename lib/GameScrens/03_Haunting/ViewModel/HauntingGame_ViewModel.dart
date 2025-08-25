import 'package:flutter/cupertino.dart';
import 'package:happyhaunting/Data/Database/Enums/GameCategory.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';

class HauntingGame_ViewModel extends ChangeNotifier {

  bool isGameLoaded = false;

  GameCategory gameCategory = GameCategory.ghosts;

  //FIELD FOR SELECTED GHOST FROM LIST
  Haunting_Ghost? chosenGhost;

  List<List<String>> entries = [];


  void refresh(){
    notifyListeners();
  }


  void clearData() {
    print("CZYSZCZENIE!");
    gameCategory = GameCategory.ghosts;
    isGameLoaded = false;
    chosenGhost = null;
    entries = [];
    notifyListeners();
  }

  void setIsGameLoaded(bool value){
    isGameLoaded = value;
    notifyListeners();
  }

  void setGameCategory(GameCategory category){
    gameCategory = category;
    notifyListeners();
  }

  void setChosenGhost(Haunting_Ghost? ghost) {
    chosenGhost = ghost;
    notifyListeners();
  }

  void addEntry(List<String> entry) {
    entries.add(entry);
    notifyListeners();
  }

  void removeEntryAt(int i) {
    entries.removeAt(0);
    notifyListeners();
  }



}