import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';

import '../../../../../Data/Database/DatabaseStructure/00_Ghost.dart';

class LevelDetails_GUI{
  static getLevelName(LevelSelector_ViewModel levelSelector_ViewModel, double width, double height) {
    return GestureDetector(
      onTap: (){
        levelSelector_ViewModel.setChosenTrappedGhost(null);
      },
      child: Container(
        height: height, width: width,// color: Colors.lightGreen,
        child: TextAndFont.getText(width, height, levelSelector_ViewModel.chosenLevel!.name),
      ),
    );
  }

  static getDescription(LevelSelector_ViewModel levelSelector_ViewModel, double width, double height) {
    String text = levelSelector_ViewModel.chosenTrappedGhost == null ?
        levelSelector_ViewModel.chosenLevel!.startingText :
        levelSelector_ViewModel.chosenTrappedGhost!.hintText;
    return Container(
      height: height, width: width, //color: Colors.yellow,
      child: TextAndFont.getText(width, height, text),
    );
  }

  static getTrappedGhostsList(LevelSelector_ViewModel levelSelector_ViewModel, double width, double height) {
    double paddingHeight = height * 0.1;
    return Container(
      height: height, width: width,// color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(levelSelector_ViewModel.chosenLevel!.trappedGhosts.length, (index) {
          Ghost ghost = levelSelector_ViewModel.chosenLevel!.trappedGhosts[index];
          bool isSelected = levelSelector_ViewModel.chosenTrappedGhost == ghost;
          double ghostIconHeight = isSelected ? height : height * 0.7;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button_GUI.getButton(ghostIconHeight, ghost.icon,
              catalog: 'Ghosts',
              opacity: isSelected ? 1 : 0.7,
              function: () => levelSelector_ViewModel.setChosenTrappedGhost(ghost),
              imageSize: 1
              ),
              Padding(padding: EdgeInsets.only(left: paddingHeight))
            ],
          );
        }),
      )
    );
  }

}