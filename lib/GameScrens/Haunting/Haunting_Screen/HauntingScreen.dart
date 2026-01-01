import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/03_Level.dart';
import 'package:happyhaunting/Data/Database/Enums/GameCategory.dart';
import 'package:happyhaunting/Data/Database/Enums/Window/Haunting/GameWindow.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/ShadowSceen/ShadowScreen_GUI.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Screen/GUI/DialogWindow/DialogWindow_GUI.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Screen/GUI/GhostData/GUI/GhostData_GUI.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Screen/GUI/LoadingScreen/LoadingScreen_GUI.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Screen/GUI/MortalData/GUI/MortalData_GUI.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Screen/Log_Entry/Log_Entry.dart';
import 'package:happyhaunting/ViewModels/Haunting/HauntingGame_ViewModel.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' as vm;

import '../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../Haunting_Game/00_LoadingGameElements/Haunting_Camera.dart';
import '../Haunting_Game/Classes/Level/Haunting_Level.dart';
import 'GUI/Buttons/HauntingScreen_Buttons_GUI.dart';
import 'GUI/SidePanel/SidePanel_GUI.dart';

class HauntingScreen extends StatefulWidget {

  final Level chosenLevel;
  final LevelSelector_ViewModel levelSelector_ViewModel;

  const HauntingScreen({super.key, required this.chosenLevel, required this.levelSelector_ViewModel});

  @override
  State<HauntingScreen> createState() => _HauntingScreenState();
}

class _HauntingScreenState extends State<HauntingScreen> {

  late Haunting_Game haunting_game;

  TransformationController _controller = TransformationController();

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final viewModel = context.watch<HauntingGame_ViewModel>();

    double sidePanel_Width = screenWidth * 0.2;
    double sidePanel_Height = screenHeight * 0.85;

    double sidePanel_Buttons_Height = screenHeight * 0.1;

    double dialogWindow_Height = screenHeight * 0.7;
    double dialogWindow_Width = screenWidth * 0.8;


    double ghostData_Height = screenHeight * 0.9;
    double ghostData_Width = (3 / 2) * ghostData_Height;

    double floorButtons_Height = sidePanel_Buttons_Height * 2;
    double floorButtons_Width = floorButtons_Height;


    double sidePanel_Padding_Top = (screenHeight - sidePanel_Height - sidePanel_Buttons_Height) / 2;
    double sidePanel_Padding_Left = sidePanel_Width * 0.1;


    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment(0, 0),
          children: [
            //GAME
            InteractiveViewer(
              transformationController: _controller,
              minScale: 1.5,
              maxScale: 5.0,
              // boundaryMargin: EdgeInsets.all(double.infinity), // brak ograniczeń krawędzi
              child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  color: Colors.blueGrey.shade200,
                  child: GameWidget(game: haunting_game)
              ),
            ),
            //SIDE PANEL
            Positioned(
                top: sidePanel_Padding_Top, left: sidePanel_Padding_Left,
                child: SidePanel_GUI.getSidePanel(context, viewModel, sidePanel_Height, sidePanel_Width, haunting_game)),
                // child: SidePanel_GUI.getSidePanel(context, viewModel, sidePanel_Height, sidePanel_Width, haunting_game)),
            // LOG ENTRIES
            if(viewModel.isLogEntriesWindowVisible)
            Positioned(
                bottom: 0, right: 0,
                child: Log_entry.getLogEntryWindow(screenWidth, screenHeight, viewModel)
            ),

            ///BUTTONS
            // SIDE PANEL BUTTONS
            Positioned(
              bottom: 0, left: 0,
              child: HauntingScreen_Buttons_GUI.getPanelButton(context, sidePanel_Width, sidePanel_Buttons_Height),),
            // LOG BUTTON
            Positioned(
              bottom: 0, right: 0,
              child: HauntingScreen_Buttons_GUI.getLogButton(context, sidePanel_Buttons_Height)),
            // FLOOR BUTTONS
            Positioned(
                top: 0, right: 0,
                child: HauntingScreen_Buttons_GUI.getFloorButton(context, floorButtons_Height)),



            //SCREEN SHADOW
            if(viewModel.isDialogWindowVisible == true || viewModel.gameWindow != GameWindow.empty)
              ShadowScreen_GUI.getShadowScreen(screenWidth, screenHeight),


            //DIALOG WINDOW
            // if(viewModel.isDialogWindowVisible == true)
            DialogWindow_GUI.getDialogScreen(context, viewModel, dialogWindow_Width, dialogWindow_Height, screenWidth, screenHeight),

            if(viewModel.gameWindow == GameWindow.ghostData && viewModel.chosenGhost != null)
            GhostData_GUI.getGhostDataWindow(context, viewModel, screenWidth, screenHeight, ghostData_Width, ghostData_Height),

            if(viewModel.gameWindow == GameWindow.mortalData && viewModel.chosenMortal != null)
              MortalData_GUI.getMortalDataWindow(context, viewModel, screenWidth, screenHeight, ghostData_Width, ghostData_Height),

            LoadingScreen_GUI.getLoadingScreen(context, screenHeight, screenWidth)

          ],
        )
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Box box_Ghosts = Hive.box<Ghost>('ghosts');

    final viewModel = context.read<HauntingGame_ViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HauntingGame_ViewModel>().setDialogData(widget.chosenLevel.startingText, true);
    });
    print("""
    ${widget.chosenLevel.levelWidth}, ${ widget.chosenLevel.tileWidth},
    ${widget.chosenLevel.levelHeight}, ${ widget.chosenLevel.tileHeight},
    ${widget.chosenLevel.fileName}
    
    """);

    haunting_game = Haunting_Game()
      ..levelName = widget.chosenLevel.fileName
      ..mortals = widget.chosenLevel.mortals
      ..width = widget.chosenLevel.levelWidth
      ..height = widget.chosenLevel.levelHeight
      ..tileWidth = widget.chosenLevel.tileWidth
      ..tileHeight = widget.chosenLevel.tileHeight
      ..numberOfFloors = widget.chosenLevel.numberOfFloors
      ..numberOfFloorsBasement = widget.chosenLevel.numberOfFloorsBasement
      ..viewModel = viewModel
      ..ghosts = widget.levelSelector_ViewModel.chosenTeam
      ..trappedGhosts = widget.chosenLevel.trappedGhosts
      ..script = widget.chosenLevel.script
    ;
    viewModel.game = haunting_game;

  double scale = 1.5;

  double height = (widget.chosenLevel.levelHeight / scale) * 0.03;
  double width = (widget.chosenLevel.levelWidth / scale) * 0.03;

    _controller.value =  vm.Matrix4.translationValues(-width, -height, 0.0) * vm.Matrix4.diagonal3Values(scale, scale, 1.0);


    Future.delayed(Duration(seconds: 3), (){
      setState(() {});
    });

  }

  @override
  void dispose() {
    super.dispose();
    final viewModel = context.read<HauntingGame_ViewModel>();
    _controller.dispose();
    viewModel.clearData();
  }

}