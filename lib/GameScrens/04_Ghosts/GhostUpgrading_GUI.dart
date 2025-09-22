import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Window/GhostSelector/GhostSelector_WindowMode.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Abilities/PowerList.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/DedicatedArea/DedicatedArea_GUI.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Divider/Divider_GUI.dart';
import 'package:happyhaunting/GameScrens/ViewModels/GhostSelector/GhostSelector_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../00_GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';

class GhostUpgrading_GUI{
  static Widget getGhostUpgradeLayers(BuildContext context, double width, double height) {
    return Container(
      width: width, height: height,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          FramedWindow_GUI.getFramedWindow(
              context, width, height, backgroundOpacity: 0.8,
              function: () => getGhostUpgradeContent(context, height, width,)
          )
        ],
      ),
    );
  }

  static getGhostUpgradeContent(BuildContext context, double height, double width) {

    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    GhostSelector_WindowMode currentMode = ghostSelector_ViewModel.windowMode;

    return Container(
      width: width, height: height,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          if(currentMode == GhostSelector_WindowMode.Abilities)
            getPowersBox(context, width, height)
        ],
      )
    );
  }

  static getPowersBox(BuildContext context, double width, double height) {

    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();

    double itemWidth = width * 0.8;

    //BOXES
    // double padding = height * 0.02;
    double abilitiesButtonsBoxHeight = height * 0.3;
    double dividerBoxHeight = height * 0.1;
    double abilityDescriptionBoxHeight = height - abilitiesButtonsBoxHeight - dividerBoxHeight;

    //CONTENT
    double abilitiesButtonsHeight = abilitiesButtonsBoxHeight * 0.85;

    return Container(
      width: width, height: height, //color: Colors.pink,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Padding(padding: EdgeInsets.only(top: padding)),
          DedicatedArea_GUI.getDedicatedArea(context, width, abilitiesButtonsBoxHeight,
                  () => PowerList.getPowerList(ghostSelector_ViewModel, itemWidth, abilitiesButtonsHeight)
          ),
          DedicatedArea_GUI.getDedicatedArea(context, width, dividerBoxHeight,
                  () => Divider_GUI.getDivider(itemWidth, dividerBoxHeight)
          ),
          DedicatedArea_GUI.getDedicatedArea(context, width, abilityDescriptionBoxHeight,
                  null
          ),
          // DedicatedArea_GUI.getDedicatedArea(context, width, dividerHeight, null),
          // DedicatedArea_GUI.getDedicatedArea(context, width, abilityDescriptionHeight, null),
        ],
      ),
    );
  }

}