import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/02_Mortal.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/03_Level.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/00_LoadingGameElements/Haunting_Camera.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/00_LoadingGameElements/LoadingGameElements.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Haunting_Level.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';



class Haunting_Game extends FlameGame with HasCollisionDetection {

  //DATA SET FROM PREVIOUS SCREEN
  String levelName = "Level_Test";
  List<Mortal> mortals = [];
  List<Ghost> ghosts = [];
  double width = 1920;
  double height = 1080;
  HauntingGame_ViewModel viewModel = HauntingGame_ViewModel();

  late Haunting_Level level;
  late List<Vector2> mortalActionPoints = [];



  @override
  Future<void> onLoad() async {
    await images.loadAllImages();
    level = LoadingGameElements.loadLevel(this);
    Haunting_Camera.loadCamera(this, level);
    return super.onLoad();
  }
}