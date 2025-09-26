import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Button/ButtonType.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Background/Background.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Divider/Divider_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/ViewModels/Selector/GhostSelector_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../../Data/Database/DatabaseStructure/00_Ghost.dart';

class Managing_CoreData{
  static getGhostCoreData(BuildContext context, double width, double height, List<double> segmentsHeights, double dividerHeight) {
    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    Ghost? ghost = ghostSelector_ViewModel.chosenGhost;
    double bigCircleSize = height * 0.3;

    return Container(
      height: height, width: width, //color: Colors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getImagesBox(ghost, width, segmentsHeights[0]),
          Divider_GUI.getDivider(width, dividerHeight),
          getNameAndDescriptionBox(ghost, width, segmentsHeights[1]),
          Divider_GUI.getDivider(width, dividerHeight),
          getTierBox(ghost, width, segmentsHeights[2], bigCircleSize)
        ],
      ),
    );
  }

  static getImagesBox(Ghost? ghost, double width, double height) {
    return Container(
      height: height, width: width,// color: Colors.blue,
    );
  }

  static getNameAndDescriptionBox(Ghost? ghost, double width, double height) {
    return Container(
      height: height, width: width, //color: Colors.blue,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          // Background.getBackgroundShade(width, height)
        ],
      ),
    );
  }

  static getTierBox(Ghost? ghost, double width, double height, double bigCircleSize) {

    return Container(
      height: height, width: width, //color: Colors.blue,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          // Button_GUI.getButton(bigCircleSize, icon)
        ],
      ),
    );
  }


}