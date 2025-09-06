import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/03_Level.dart';
import 'package:happyhaunting/Data/Database/Enums/GameCategory.dart';
import 'package:happyhaunting/Data/Database/Enums/Window/GameWindow.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Screen/GUI/DialogWindow/DialogWindow_GUI.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Screen/GUI/GhostData/GhostData_GUI.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Screen/Log_Entry/Log_Entry.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../Haunting_Game/00_LoadingGameElements/Haunting_Camera.dart';
import '../Haunting_Game/Classes/Level/Haunting_Level.dart';
import 'GUI/Buttons/HauntingScreen_Buttons_GUI.dart';
import 'GUI/SidePanel/SidePanel_GUI.dart';

class HauntingScreen extends StatefulWidget {

  final Level chosenLevel;

  const HauntingScreen({super.key, required this.chosenLevel});

  @override
  State<HauntingScreen> createState() => _HauntingScreenState();
}

class _HauntingScreenState extends State<HauntingScreen> {

  late Haunting_Game haunting_game;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final viewModel = context.watch<HauntingGame_ViewModel>();

    double sidePanel_Width = screenWidth * 0.2;
    double sidePanel_Height = screenHeight * 0.9;
    double sidePanel_Buttons_Height = screenHeight - sidePanel_Height;

    double dialogWindow_Height = screenHeight * 0.7;
    double dialogWindow_Width = screenWidth * 0.8;

    double ghostData_Height = screenHeight * 0.9;
    double ghostData_Width = (3 / 2) * ghostData_Height;

    double floorButtons_Height = sidePanel_Buttons_Height * 2;
    double floorButtons_Width = floorButtons_Height;


    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment(0, 0),
          children: [
            //GAME
            InteractiveViewer(
              minScale: 1,
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
                top: 0, left: 0,
                child: SidePanel_GUI.getSidePanel(context, viewModel, sidePanel_Height, sidePanel_Width, haunting_game)),
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




            //DIALOG WINDOW
            if(viewModel.isDialogWindowVisible == true)
            DialogWindow_GUI.getDialogWindow(context, viewModel, dialogWindow_Width, dialogWindow_Height, screenWidth, screenHeight),

            if(viewModel.gameWindow == GameWindow.ghostData && viewModel.chosenGhost != null)
            GhostData_GUI.getGhostDataWindow(context, viewModel, screenWidth, screenHeight, ghostData_Width, ghostData_Height),



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

    haunting_game = Haunting_Game()
      ..levelName = widget.chosenLevel.fileName
      ..mortals = widget.chosenLevel.mortals
      ..width = widget.chosenLevel.levelWidth
      ..height = widget.chosenLevel.levelHeight
      ..viewModel = viewModel
      ..ghosts = [box_Ghosts.getAt(1), box_Ghosts.getAt(2), box_Ghosts.getAt(3)]
      ..trappedGhosts = widget.chosenLevel.trappedGhosts
    ;
    viewModel.game = haunting_game;

    Future.delayed(Duration(seconds: 3), (){
      setState(() {});
    });

  }

  @override
  void dispose() {
    super.dispose();
    final viewModel = context.read<HauntingGame_ViewModel>();
    viewModel.clearData();
  }

}