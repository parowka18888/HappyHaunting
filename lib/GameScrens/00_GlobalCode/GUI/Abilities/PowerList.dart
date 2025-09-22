import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/01_Power.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Abilities/Getter/PowerList_Getter.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Background/Background.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/Getter/IconGetter.dart';
import 'package:happyhaunting/GameScrens/ViewModels/GhostSelector/GhostSelector_ViewModel.dart';

import '../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../../Data/Database/Enums/UI/Button/ButtonType.dart';

class PowerList{
  static getPowerList(GhostSelector_ViewModel viewModel, double width, double height) {

    double iconsBoxHeight = height * 0.8;
    double hintBoxHeight =  height - iconsBoxHeight;

    return Container(
      height: height, width: width,// color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            getIconsBox(viewModel, iconsBoxHeight, width),
            getHintBox(viewModel, hintBoxHeight, width),
        ],
      ),
    );
  }

  static getIconsBox(GhostSelector_ViewModel viewModel, double height, double width) {

    Ghost? ghost = viewModel.chosenGhost;
    double iconPadding = height * 0.15;
    double iconSize = PowerList_Getter.getScaledIconSize(height, width, iconPadding);
    // double iconSize = height - iconPadding;
    return Container(
      width: width, height: height,// color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getPowerIcon(iconSize, ghost, 0, viewModel),
          Padding(padding: EdgeInsets.only(left: iconPadding)),
          getPowerIcon(iconSize, ghost, 1, viewModel),
          Padding(padding: EdgeInsets.only(left: iconPadding)),
          getPowerIcon(iconSize, ghost, 2, viewModel),
          Padding(padding: EdgeInsets.only(left: iconPadding)),
          getPowerIcon(iconSize, ghost, 3, viewModel),
        ],
      ),
    );
  }

  static getHintBox(GhostSelector_ViewModel viewModel, double height, double width) {
    return Container(
      width: width, height: height, //color: Colors.pink,
      child: Text("WYBIERZ MOC"),
    );
  }

  static getPowerIcon(double iconSize, Ghost? ghost, int index, GhostSelector_ViewModel viewModel) {
    String icon = "";
    Power? power;
    if(ghost != null && ghost.powers.length >= index){
      power = ghost.powers[index];
      icon = power.icon;
    } else {
      icon = "UnknownPower";
    }

    return Container(
      height: iconSize, width: iconSize, //color: Colors.blue,
      child: Stack(alignment: Alignment(0, 0),
        children: [
          Background.getBackgroundLayers(iconSize, iconSize),
          Button_GUI.getButton(
              iconSize, icon, catalog: 'Powers', buttonType: ButtonType.Square,
              function: () => viewModel.setChosenPower(power)
          ),
        ],
      ),
    );
  }

}