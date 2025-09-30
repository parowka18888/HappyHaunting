import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/03_Level.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/GameScrens/LevelPicker/MapPicker/MapPicker_GUI.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../GlobalCode/GUI/Background/Background.dart';
import '../GlobalCode/GUI/Buttons/SpecialButtons/CancelButton/CancelButton_GUI.dart';
import '../GlobalCode/GUI/Buttons/SpecialButtons/CancelButton/Mechanics/CancelButton_Mechanics.dart';
import '../GlobalCode/GUI/Resources/ResourceBar_GUI.dart';
import '../GlobalCode/Navigator/AppNavigator.dart';
import '../../ViewModels/Haunting/HauntingGame_ViewModel.dart';
import 'ChapterPicker/ChapterPicker_GUI.dart';
import 'ExpansionPicker/ExpansionPicker_GUI.dart';
import 'Template/LevelPickerTemplate_GUI.dart';

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
    LevelSelector_ViewModel levelSelector_ViewModel = context.watch<LevelSelector_ViewModel>();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double pickerHeight = screenHeight * 0.7;
    double pickerWidth = screenWidth * 0.8;

    bool isChapterChosen = levelSelector_ViewModel.chosenChapter == null ? false : true;
    bool isExpansionChosen = levelSelector_ViewModel.chosenExpansion == null ? false : true;

    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment(0, 0),
          children: [
            Background.getBackground(screenWidth, screenHeight),
            ResourceBar_GUI.getResourceBar(context, screenWidth, screenHeight),
            CancelButton_GUI.getCancelButton(screenHeight, function: () => CancelButton_Mechanics.popScreen(context)),

            LevelPickerTemplate_GUI.getLevelPickerTemplate(context, pickerWidth, pickerHeight,
                isActive: !isExpansionChosen,
                canPop: false,
                function: () => ExpansionPicker_GUI.getExpansionPickerBox(context, pickerWidth, pickerHeight)
            ),

            LevelPickerTemplate_GUI.getLevelPickerTemplate(context, pickerWidth, pickerHeight,
                isActive: isExpansionChosen && !isChapterChosen,
                canPop: true,
                function: () => ChapterPicker_GUI().getLevelPickerBox(context, pickerWidth, pickerHeight)
            ),

            LevelPickerTemplate_GUI.getLevelPickerTemplate(context, pickerWidth, pickerHeight,
                isActive: isExpansionChosen && isChapterChosen,
                canPop: true,
                function: () => MapPicker_GUI.getMapPickerBox(context, pickerWidth, pickerHeight)
            ),

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