import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Moon/Moon_GUI.dart';
import 'package:happyhaunting/GameScrens/ViewModels/GhostSelector/GhostSelector_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import 'Ghost_GUI.dart';

class GhostView_GUI{
  static getGhostViewLayer(BuildContext context, double width, double height) {

    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
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
          Positioned(top: moonPadding, child: Moon_GUI.getMoonLayers(context, moonBoxSize)),
          //GHOST IMAGE
          Positioned(top: finalGhostPadding, child: Ghost_GUI.getGhostImage(context, height, ghostWidth)),
        ],
      ),
    );
  }


}