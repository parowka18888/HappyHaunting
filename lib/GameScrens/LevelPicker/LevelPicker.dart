import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/03_Level.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Background/Background.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Screen/HauntingScreen.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Screen/HauntingScreen.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../GlobalCode/Navigator/AppNavigator.dart';
import '../../ViewModels/Haunting/HauntingGame_ViewModel.dart';

class LevelPicker extends StatefulWidget {
  const LevelPicker({super.key});

  @override
  State<LevelPicker> createState() => _LevelPickerState();
}

class _LevelPickerState extends State<LevelPicker> {

  late Haunting_Game haunting_game;

  @override
  Widget build(BuildContext context) {

    Box box_Levels = Hive.box<Level>('levels');
    final viewModel = context.watch<HauntingGame_ViewModel>();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment(0, 0),
          children: [
            Background.getBackground(screenWidth, screenHeight),

          ],
        ),
        // child: Container(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         // Image.asset('assets/images/Mortals/TestMortal3.png'),
        //         ElevatedButton(onPressed: (){viewModel.clearData();AppNavigator.navigateToScreen(context, HauntingScreen(chosenLevel: box_Levels.getAt(0)));}, child: Text("Level testowy 1")),
        //         ElevatedButton(onPressed: (){viewModel.clearData();AppNavigator.navigateToScreen(context, HauntingScreen(chosenLevel: box_Levels.getAt(1)));}, child: Text("Level testowy 2")),
        //         ElevatedButton(onPressed: (){viewModel.clearData();AppNavigator.navigateToScreen(context, HauntingScreen(chosenLevel: box_Levels.getAt(2)));}, child: Text("Level testowy 3 (piętra)")),
        //       ],
        //     )
        // ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    haunting_game = Haunting_Game();

  }

}