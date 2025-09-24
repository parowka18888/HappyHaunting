import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/LevelScript/LevelScript.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/00_LoadingGameElements/LoadingGameElements.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Astar/AStar_Grid.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Level/Subclasses/Exit/Haunting_Exit.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/UsedPowers/UsedPowers.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Scripts/LevelScripts/ScriptNavigator/Scripts_LevelBased.dart';
import 'package:happyhaunting/ViewModels/Haunting/HauntingGame_ViewModel.dart';

import '../../../../../Data/Database/DatabaseStructure/02_Mortal.dart';
import '../GhostSpot/Haunting_GhostSpot.dart';


class Haunting_Level extends World with HasGameReference<Haunting_Game> {

  final String levelName;
  Haunting_Level({required this.levelName});

  //DATA SET FROM PREVIOUS SCREEN
  List<Haunting_Mortal> mortals = [];
  List<Haunting_Ghost> ghosts = [];
  List<Haunting_Ghost> trappedGhosts = [];
  List<Haunting_GhostSpot> ghostSpots = [];
  List<Haunting_Floor> floors = [];
  List<Haunting_Exit> exitPoints = [];

  //LEVEL SCRIPTS
  LevelScript? script;
  List<int> conditionsMet = []; //LIST FOR CHECKING WHICH CONDITION IS MET
  bool isScriptExecuted = false;
  List<int> listOfIgnoredCollisions_ID = [];


  List<UsedPower> usedPowers = [];

  HauntingGame_ViewModel viewModel = HauntingGame_ViewModel();

  late TiledComponent level;
  // late List<Vector2> mortalActionPoints = [];
  late List<List<bool>> walkableGrid;
  late List<Haunting_Room> rooms = [];



  @override
  FutureOr<void> onLoad() async {

    level = await TiledComponent.load('${levelName}.tmx', Vector2.all(16));

    LoadingGameElements.loadLevelRooms(this, game);
    LoadingGameElements.loadLevelFloors(this, game);
    LoadingGameElements.loadLevelMortalActionPoints(this, game);
    LoadingGameElements.loadLevelMortalSpecialPoints(this, game);
    LoadingGameElements.loadLevelObjects(this, game);
    // LoadingGameElements.loadFloorsByActionPoints(this);

    AStar_Grid.getWalkableGrid(this);


    add(level);
    viewModel.setIsGameLoaded(true);

    return super.onLoad();
  }


  //TIME FOR SLOWING DOWN SOME METHODS
  double timeSinceLastReload = 0.0;
  double refreshTime = 0.5;
  @override
  void update(double dt) {
    timeSinceLastReload += dt;
    if (timeSinceLastReload >= refreshTime) {
      //SCRIPT CHECKER
      Scripts_LevelBased.getScript_Navigator(game);

      timeSinceLastReload = 0.0;
    }

    super.update(dt);
  }


}