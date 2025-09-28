import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/GameCategory.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Subclasses/TrappedGhost/CheckConditions/TrappedGhost_Checker.dart';
import 'package:happyhaunting/ViewModels/Haunting/HauntingGame_ViewModel.dart';
import 'package:provider/provider.dart';

class HauntingScreen_Buttons_GUI{
  static getPanelButton(BuildContext context, double width, double height) {
    HauntingGame_ViewModel viewModel = context.watch<HauntingGame_ViewModel>();
    return Container(
      width: width, height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Button_GUI.getButton(height, 'Ghost', function: () => viewModel.setGameCategory(GameCategory.ghosts)),
          Button_GUI.getButton(height, 'Mortal', function: () => viewModel.setGameCategory(GameCategory.mortals)),
          if(viewModel.isGameLoaded && TrappedGhost_Checker.checkIfThereIsGhostToFree(viewModel.game))
          Button_GUI.getButton(height, 'TrappedGhost', function: () => viewModel.setGameCategory(GameCategory.trapped)),
        ],
      ),
    );
  }

  static getLogButton(BuildContext context, double size) {
    HauntingGame_ViewModel viewModel = context.watch<HauntingGame_ViewModel>();
    return Container(
      width: size, height: size,
      child: Button_GUI.getButton(size, 'Ghost', function: () => viewModel.setIsLogEntriesWindowVisible(!viewModel.isLogEntriesWindowVisible)),
    );
  }

  static getFloorButton(BuildContext context, double size) {
    HauntingGame_ViewModel viewModel = context.watch<HauntingGame_ViewModel>();
    double buttonSize = size / 2;
    return Container(
      height: size, width: size,
      child: Stack(alignment: Alignment(0, 0),
        children: [
          Positioned(
            top: 0, right: 0,
            child: Button_GUI.getButton(buttonSize, 'FloorUp', function: () => viewModel.setCurrentFloor(1)),),
          Positioned(
            bottom: 0, left: 0,
            child: Button_GUI.getButton(buttonSize, 'FloorDown', function: () => viewModel.setCurrentFloor(-1)),)
        ],
      ),
    );
  }

}