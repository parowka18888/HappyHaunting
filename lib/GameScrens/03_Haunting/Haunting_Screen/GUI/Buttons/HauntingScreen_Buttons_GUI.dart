import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/GameCategory.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';
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
          Button_GUI.getButton(height, 'TrappedGhost', function: () => viewModel.setGameCategory(GameCategory.trapped)),
        ],
      ),
    );
  }

}