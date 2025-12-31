import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/ViewModels/Haunting/HauntingGame_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../../ViewModels/Selector/Ghost/GhostSelector_ViewModel.dart';
import '../../../../../ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import '../../../../GlobalCode/Navigator/AppNavigator.dart';
import '../../../../Haunting/Haunting_Screen/HauntingScreen.dart';

class Play_GUI{

  static getInfoBox(double width, double height) {
    return Container(
      height: height, width: width,
      child: TextAndFont.getText(width, height, 'LevelPicker_Info'),
    );
  }

  static getPlayButton(BuildContext context, double width, double height) {
    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    LevelSelector_ViewModel levelSelector_ViewModel = context.watch<LevelSelector_ViewModel>();
    HauntingGame_ViewModel hauntingGame_ViewModel = context.watch<HauntingGame_ViewModel>();

    height = height * 0.7;
    return Button_GUI.getButton(
        height,
        'ArrowRight',
      function: () {
        hauntingGame_ViewModel.clearData();
        AppNavigator.navigateToScreen(context, HauntingScreen(chosenLevel: levelSelector_ViewModel.chosenLevel!, levelSelector_ViewModel: levelSelector_ViewModel));
        // ghostSelector_ViewModel.clear();
        // levelSelector_ViewModel.clear();

      }

    );
  }

  static getSettingsBox(LevelSelector_ViewModel levelSelector_ViewModel, double width, double height) {
    bool isLevelBeaten = levelSelector_ViewModel.chosenLevel!.isBeaten;

    return Container(
      height: height, width: width, //color: Colors.deepPurple,
      child: isLevelBeaten ? getSettingsContainer(levelSelector_ViewModel, width, height) :
        TextAndFont.getText(width, height, 'LevelPicker_SettingUnavailable')
    );
  }

  static getSettingsContainer(LevelSelector_ViewModel levelSelector_ViewModel, double width, double height) {
    double entryHeight = height * 0.3;
    double padding = (height - (entryHeight * 3)) / 2;
    return Container(
      height: height, width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getSettingEntry('Setting_Option_MultiplyGhosts', width, entryHeight,
              levelSelector_ViewModel.isMultipliedGhostsModeOn,
              () => levelSelector_ViewModel.toggleIsMultipliedGhostsMode(),
          ),
          Padding(padding: EdgeInsets.only(top: padding)),
          getSettingEntry('Setting_Option_HardMode', width, entryHeight,
            levelSelector_ViewModel.isHardModeOn,
                () => levelSelector_ViewModel.toggleHardMode(),
          ),
          Padding(padding: EdgeInsets.only(top: padding)),
          getSettingEntry('Setting_Option_IgnoreTrappedGhosts', width, entryHeight,
            levelSelector_ViewModel.isSkipTrapsModeOn,
                () => levelSelector_ViewModel.toggleSkipTraps(),
          ),
        ],
      ),
    );
  }

  static getSettingEntry(String text, double width, double height, bool value, VoidCallback function) {
    double buttonWidth = height;
    double textWidth = width - buttonWidth;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: height, width: buttonWidth,
          child: Button_GUI.getButton(height, value ? 'Moon' : "EmptySlot",
            function: function
          ),
        ),
        Container(
          height: height, width: textWidth,
          child: TextAndFont.getText(textWidth, height, text),
        )
      ],
    );
  }

}