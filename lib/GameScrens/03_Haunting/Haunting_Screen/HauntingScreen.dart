import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/03_Level.dart';
import 'package:happyhaunting/Data/Database/Enums/GameCategory.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Setter/PowerSetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Screen/Log_Entry/Log_Entry.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../Haunting_Game/00_LoadingGameElements/Haunting_Camera.dart';
import '../Haunting_Game/Classes/Level/Haunting_Level.dart';
import 'GUI/SidePanel/SidePanel_GUI.dart';

class HauntingScreen extends StatefulWidget {

  final Level chosenLevel;

  const HauntingScreen({super.key, required this.chosenLevel});

  @override
  State<HauntingScreen> createState() => _HauntingScreenState();
}

class _HauntingScreenState extends State<HauntingScreen> {

  late Haunting_Game haunting_game;
  int chosenFloor = 0;
  int chosenFloor_Up_Basement = 1;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final viewModel = context.watch<HauntingGame_ViewModel>();

    double sidePanel_Height = screenHeight;
    double sidePanel_Width = screenWidth * 0.2;

    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment(0, 0),
          children: [
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
            SidePanel_GUI.getSidePanel(context, viewModel, sidePanel_Height, sidePanel_Width, haunting_game),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(onPressed: (){
                  chosenFloor++;
                  print("Zmiana piętra UP $chosenFloor");
                  setState(() {

                  });
                  Haunting_Camera.updateCameraByFloor(haunting_game ,chosenFloor);
                  }, child: Text("Piętro UP")),
                ElevatedButton(onPressed: (){print("Zmiana piętra DOWN");
                  chosenFloor--;
                print("Zmiana piętra DOWN $chosenFloor");
                Haunting_Camera.updateCameraByFloor(haunting_game ,chosenFloor);
                }, child: Text("Piętro Down")),
                // if(widget.viewModel.isGameLoaded == true)
                // ElevatedButton(onPressed: (){}, child: Text("Liczba śmiertelników: ${haunting_game.level.mortals.length}. imię pierwszego to ${haunting_game.level.mortals[0].name}"))
              ],
            ),



            ///
            // Positioned(
            //   bottom: 0, right: 0,
            //     child: Log_entry.getLogEntryWindow(screenWidth, screenHeight, viewModel)
            // )
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
    haunting_game = Haunting_Game()
      ..levelName = widget.chosenLevel.fileName
      ..mortals = widget.chosenLevel.mortals
      ..width = widget.chosenLevel.levelWidth
      ..height = widget.chosenLevel.levelHeight
      ..viewModel = viewModel
      ..ghosts = [box_Ghosts.getAt(1), box_Ghosts.getAt(2), box_Ghosts.getAt(3)]
      ..trappedGhosts = widget.chosenLevel.trappedGhosts

    ;

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