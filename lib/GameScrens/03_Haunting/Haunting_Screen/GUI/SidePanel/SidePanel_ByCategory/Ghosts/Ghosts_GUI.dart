import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/GameCategory.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';

import 'Panel/GhostPanel_GUI.dart';

class Ghosts_GUI{
  static getGhostList(BuildContext context, HauntingGame_ViewModel viewModel, double height, double width, Haunting_Game game) {
    if(viewModel.isGameLoaded == true){
      List<Haunting_Ghost> ghosts = [];
      if(viewModel.gameCategory == GameCategory.ghosts){
        ghosts = game.level.ghosts;
      } else if (viewModel.gameCategory == GameCategory.trapped){
        ghosts = game.level.trappedGhosts.where((ghost) => ghost.isFree == false).toList();
      }
      int itemCount = ghosts.length;
      double itemHeight = height / 5;
      return Container(
        height: height, width: width, color: Colors.amber,
        child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context, index){
              Haunting_Ghost ghost = ghosts[index];
              return GhostPanel_GUI.getGhostPanel(context, width, itemHeight, viewModel, ghost);
            }),
      );
    } else {
      return Container();
    }
  }
}