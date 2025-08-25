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
            Positioned(left: 0,top: 0,
                child: Container(
                  width: screenWidth * 0.2, height: screenHeight, color: Colors.amber,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: screenWidth, height: screenHeight * 0.9, color: Colors.red,
                        child: ListView.builder(itemCount: viewModel.gameCategory == GameCategory.ghosts ? haunting_game.ghosts.length : haunting_game.mortals.length,
                            itemBuilder: (context, index){
                          if(viewModel.gameCategory == GameCategory.ghosts){
                            return Container(
                              height: screenHeight * 0.3, color: Colors.green,
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        if(haunting_game.level.ghosts[index] == viewModel.chosenGhost){
                                          viewModel.setChosenGhost(null);
                                        } else {
                                          viewModel.setChosenGhost(haunting_game.level.ghosts[index]);
                                        }
                                      },
                                      child: Image.asset('assets/images/Ghosts/${haunting_game.level.ghosts[index].icon}.png', width: screenWidth * 0.05,),
                                    ),
                                    Container(height: screenHeight * 0.3 * 0.2, width: screenWidth * 0.1, color: Colors.blue,
                                      child: ListView.builder(
                                          itemCount: haunting_game.level.ghosts[index].auras.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, indexAura) {
                                        return Image.asset('assets/images/Auras/${haunting_game.level.ghosts[index].auras[indexAura].icon}.png');
                                      }),

                                    )
                                  ],),
                                  if(viewModel.chosenGhost == haunting_game.level.ghosts[index])
                                    Text("Wybrany"),
                                  Container(height: screenHeight * 0.1, width: screenWidth * 0.2, color: Colors.yellow,
                                    child: ListView.builder(
                                        itemCount: haunting_game.ghosts[index].powers.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, indexPower){
                                      return GestureDetector(
                                          onTap: (){
                                            PowerSetter.togglePowerActivation(haunting_game.level.ghosts[index].powers[indexPower]);
                                            // haunting_game.level.ghosts[index].powers[indexPower].use();
                                            viewModel.refresh();
                                            },
                                          child: Opacity(opacity: haunting_game.level.ghosts[index].powers[indexPower].isActivated ? 1.0 : 0.5, child: Stack(
                                            children: [
                                              Image.asset('assets/images/Powers/${haunting_game.level.ghosts[index].powers[indexPower].icon}.png', width: screenWidth * 0.04,),
                                              // Text(haunting_game.level.ghosts[index].powers[indexPower].currentCooldown.toString())
                                            ],
                                          ),)
                                      );
                                    }),
                                  ),
                                ],),
                            );
                          } else {
                            return Container(
                              height: screenHeight * 0.25,
                              color: haunting_game.level.mortals[index].isDefeated ? Colors.red : Colors.green,
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/Mortals/${haunting_game.mortals[index].icon}.png', width: screenWidth * 0.07,),
                                  Column(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Text("${haunting_game.level.mortals[index].name} "),
                                    Text("${haunting_game.level.mortals[index].stat_Current_Health} / ${haunting_game.level.mortals[index].stat_Health}"),
                                    Text("${haunting_game.level.mortals[index].stat_Current_Fear} / ${haunting_game.level.mortals[index].stat_Fear}"),
                                    Text("${haunting_game.level.mortals[index].stat_Current_Madness} / ${haunting_game.level.mortals[index].stat_Madness}"),
                                    Text("${haunting_game.level.mortals[index].stat_Current_Faith} / ${haunting_game.level.mortals[index].stat_Faith}"),
                                  ],)
                                ],),
                            );
                          }

                        })
                      ),
                      Container(width: screenWidth, height: screenHeight * 0.1, color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed: (){viewModel.setGameCategory(GameCategory.ghosts) ;print(viewModel.gameCategory);}, child: Text("D")),
                          ElevatedButton(onPressed: (){viewModel.setGameCategory(GameCategory.mortals);print(viewModel.gameCategory);}, child: Text("M")),
                        ],
                      ),),
                    ],
                  ),
                )
            ),
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
            Positioned(
              bottom: 0, right: 0,
                child: Log_entry.getLogEntryWindow(screenWidth, screenHeight, viewModel)
            )
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
      ..ghosts = [box_Ghosts.getAt(0), box_Ghosts.getAt(1), box_Ghosts.getAt(2)]

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