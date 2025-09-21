import 'package:flutter/cupertino.dart';
import 'package:happyhaunting/Data/Database/Enums/GameCategory.dart';
import 'package:happyhaunting/Data/Database/Enums/Window/GameWindow.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../03_Haunting/Haunting_Game/00_LoadingGameElements/Haunting_Camera.dart';

class HauntingGame_ViewModel extends ChangeNotifier {

  bool isGameLoaded = false;

  GameCategory gameCategory = GameCategory.ghosts;

  //FIELD FOR SELECTED GHOST FROM LIST
  Haunting_Ghost? chosenGhost;

  //FIELD FOR CURRENT FLOOR
  int currentFloor = 0;

  List<List<String>> entries = [];

  //DIALOG WINDOW
  bool isDialogWindowVisible = false;
  String? dialogWindow_Text = "";

  //POPUP WINDOW
  GameWindow gameWindow = GameWindow.empty;
  bool isLogEntriesWindowVisible = false;
  Haunting_Game? game;


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
    if(gameCategory == category){
      gameCategory = GameCategory.empty;
    } else {
      gameCategory = category;
    }

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

  void setIsDialogWindowVisible(bool bool) {
    isDialogWindowVisible = bool;
    chosenGhost = null;
    notifyListeners();
  }

  void setDialogData(String? text, bool isVisible) {
    isDialogWindowVisible = isVisible;
    dialogWindow_Text = text;
    notifyListeners();
  }

  void setGameWindow(GameWindow window) {
    gameWindow = window;
    notifyListeners();
  }

  void setGameWindow_GhostData(Haunting_Ghost? ghost){
    setChosenGhost(ghost);
    if(ghost == null){
      setGameWindow(GameWindow.empty);
    } else {
      setGameWindow(GameWindow.ghostData);
    }
    notifyListeners();
  }

  void setIsLogEntriesWindowVisible(bool bool) {
    isLogEntriesWindowVisible = bool;
    notifyListeners();
  }

  void setCurrentFloor(int value) {
    if(game != null){
      currentFloor += value;
      Haunting_Camera.updateCameraByFloor(game!, currentFloor);
      notifyListeners();
    }

  }



}