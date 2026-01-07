import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/Moon/Moon_GUI.dart';
import 'package:happyhaunting/ViewModels/Selector/Ghost/GhostSelector_ViewModel.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_CheckConditions.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import 'Ghost_GUI.dart';

class GhostView_GUI{
  static getGhostViewLayer(BuildContext context, double width, double height) {

    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    LevelSelector_ViewModel levelSelector_ViewModel = context.watch<LevelSelector_ViewModel>();

    Ghost? ghost = ghostSelector_ViewModel.chosenGhost;
    int headCenterPoint = 12;
    if(ghost != null){
      headCenterPoint = ghost.headCenterPoint;
    }

    double moonBoxSize = height * 0.75;
    double moonPadding = height * 0.03;
    double ghostWidth = width * 0.55;

    //CALCULATING PADDING FOR POSITIONING GHOST IMAGE
    double ghostImage_Width = ghostWidth;
    double ghostImage_Height = ghostImage_Width * 1.5;
    double additionalPadding = moonPadding + moonBoxSize / 3;
    double ghostPadding = -(ghostImage_Height * headCenterPoint / 100);
    double finalGhostPadding = ghostPadding + additionalPadding;



    return Container(
      height: height, width: width,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          //MOON
          Positioned(top: moonPadding, child: Moon_GUI.getMoonLayers(context, moonBoxSize,
              opacity: levelSelector_ViewModel.chosenLevel == null ? 1.0 : LevelSelector_CheckConditions.checkIfGhostIsInTeam(ghost, levelSelector_ViewModel) ? 0.0 : 1.0)
          ),
          //GHOST IMAGE
          Positioned(top: finalGhostPadding, child: Ghost_GUI.getGhostImage(context, height, ghostWidth)),
        ],
      ),
    );
  }


}