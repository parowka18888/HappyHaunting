import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Window/GhostSelector/GhostSelector_WindowMode.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/DedicatedArea/DedicatedArea_GUI.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Divider/Divider_GUI.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Powers/Description/PowerDescription.dart';
import 'package:happyhaunting/GameScrens/04_Ghosts/GhostData/Powers/GhostsScreen_SidePanel_Powers.dart';
import 'package:happyhaunting/GameScrens/ViewModels/GhostSelector/GhostSelector_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../00_GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import '../../00_GlobalCode/GUI/Powers/List/PowerList.dart';

class GhostsScreen_SidePanel{
  static Widget getGhostDataBox(BuildContext context, double width, double height) {
    return Container(
      width: width, height: height,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          FramedWindow_GUI.getFramedWindow(
              context, width, height, backgroundOpacity: 0.8,
              function: () => getGhostData(context, height, width,)
          )
        ],
      ),
    );
  }

  static getGhostData(BuildContext context, double height, double width) {

    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    GhostSelector_WindowMode currentMode = ghostSelector_ViewModel.windowMode;

    double availableWidth = width * 0.85;
    double availableHeight = height - (width - availableWidth);

    return Container(
      width: width, height: height,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          if(currentMode == GhostSelector_WindowMode.Abilities)
            GhostsScreen_SidePanel_Powers.getPowersBox(context, availableWidth, availableHeight)
        ],
      )
    );
  }

}