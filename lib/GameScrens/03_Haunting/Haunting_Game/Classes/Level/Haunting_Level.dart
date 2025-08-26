import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/00_LoadingGameElements/LoadingGameElements.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Astar/AStar_Grid.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Exit/Haunting_Exit.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Haunting_GhostSpot.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';

import '../../../../../Data/Database/DatabaseStructure/02_Mortal.dart';


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


}