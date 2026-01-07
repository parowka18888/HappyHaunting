import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/ViewModels/Selector/Ghost/GhostSelector_ViewModel.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../Data/Database/DatabaseStructure/00_Ghost.dart';

class TeamPicker_TeamList_GUI{
  static getTeamListBox(BuildContext context, double width, double height, double buttonWidth) {
    LevelSelector_ViewModel levelSelector_ViewModel = context.watch<LevelSelector_ViewModel>();
    int ghostsNumber = levelSelector_ViewModel.chosenLevel!.ghostsNumber;

    double padding = height * 0.1;

    return Container(
      height: height, width: width,// color: Colors.pink,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          ghostsNumber,
              (index) => Padding(
            padding: EdgeInsets.only(left: padding),
            child: getGhostSlot(index, context, height),
          ),
        ),
      ),
    );
  }

  static getGhostSlot(int index, BuildContext context, double height) {
    LevelSelector_ViewModel levelSelector_ViewModel = context.watch<LevelSelector_ViewModel>();
    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    double unknownGhost_Height = height * 0.5;
    if(levelSelector_ViewModel.chosenTeam.length > index){
      Ghost ghost = levelSelector_ViewModel.chosenTeam[index];
      return Button_GUI.getButton(height,
          ghost.icon,
          catalog: 'Ghosts',
          imageSize: 1,
          function: () => ghostSelector_ViewModel.setChosenGhost(ghost)
      );
    } else {
      return Button_GUI.getButton(unknownGhost_Height, '', opacity: 0.7);
    }
    
  }

  

}