import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Window/GhostSelector/GhostSelector_WindowMode.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/CoreData/Managing_CoreData.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Background/Background.dart';
import 'package:provider/provider.dart';

import '../../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../../../ViewModels/Selector/GhostSelector_ViewModel.dart';

class SidePanelTemplate{
  static getFirstSegment(BuildContext context, double width, double height) {
    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    Ghost? ghost = ghostSelector_ViewModel.chosenGhost;
    return Container(
      height: height, width: width, //color: Colors.purple,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.introduction)
            Managing_CoreData.getImagesBox(ghost!, width, height)
        ],
      ),
    );
  }

  static getSecondSegment(BuildContext context, double width, double height, double availableWidth) {
    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    Ghost? ghost = ghostSelector_ViewModel.chosenGhost;
    double decoratorWidth = width * 0.15;
    return Container(
      height: height, width: width, //color: Colors.purple,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Background.getBackgroundShade(width, height),
          Positioned(
              left: 0,
              child: Container(
                width: decoratorWidth,
                child: Image.asset('assets/images/UI/Decorator/TextDecorator_Left.png'),
              )),
          Positioned(
              right: 0,
              child: Container(
                width: decoratorWidth,
                child: Image.asset('assets/images/UI/Decorator/TextDecorator_Right.png'),
              )),
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.introduction)
            Managing_CoreData.getNameAndDescriptionBox(ghost!, availableWidth, height)
        ],
      ),
    );
  }

  static getThirdSegment(BuildContext context, double width, double height) {
    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    Ghost? ghost = ghostSelector_ViewModel.chosenGhost;
    return Container(
      height: height, width: width, //color: Colors.purple,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.introduction)
            Managing_CoreData.getTierBox(ghost!, width, height)
        ],
      ),
    );
  }


}