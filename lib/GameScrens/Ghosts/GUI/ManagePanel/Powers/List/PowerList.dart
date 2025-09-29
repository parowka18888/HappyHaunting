import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/01_Power.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Background/Background.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Getter/IconGetter.dart';
import 'package:happyhaunting/ViewModels/Selector/GhostSelector_ViewModel.dart';

import '../../../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../../../../Data/Database/Enums/UI/Button/ButtonType.dart';
import '../Getter/PowerList_Getter.dart';

class PowerList{

  static getPowerList(GhostSelector_ViewModel viewModel, double width, double height) {

    double iconsBoxHeight = height * 0.85;
    double hintBoxHeight =  height - iconsBoxHeight;
    return Container(
      height: height, width: width,// color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            getIconsBox(viewModel, iconsBoxHeight, width),
            // getHintBox(viewModel, hintBoxHeight, width),
        ],
      ),
    );
  }

  static getIconsBox(GhostSelector_ViewModel viewModel, double height, double width) {

    Ghost? ghost = viewModel.chosenGhost;
    double iconPadding = height * 0.15;
    double iconSize = PowerList_Getter.getScaledIconSize(height, width, iconPadding);

    return Container(
      width: width, height: height,// color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 0 : iconPadding),
            child: getPowerIcon(iconSize, ghost, index: index, viewModel: viewModel),
          );
        }),
      ),
    );
  }

  static getHintBox(GhostSelector_ViewModel viewModel, double height, double width) {
    return Container(
      width: width, height: height, //color: Colors.pink,
      child: TextAndFont.getText(width, height, "Wybierz moc"),
    );
  }

  static getPowerIcon(double iconSize, Ghost? ghost,  {
    Power? power,
    int index = 0,
    GhostSelector_ViewModel? viewModel
  }) {
    Power? chosenPower;
    if(power == null && ghost != null) chosenPower = PowerList_Getter.getPowerByIndex(ghost, index);
    bool isPowerChosen = viewModel?.chosenPower == chosenPower;

    String icon = PowerList_Getter.getIconName(power, ghost, index);
    return AnimatedContainer(duration: Duration(milliseconds: 500), curve: Curves.easeInOut,
      height: viewModel?.chosenPower == chosenPower ? iconSize : iconSize * 0.75,
      child: Stack(alignment: Alignment(0, 0),
        children: [
          Background.getBackgroundLayers(iconSize, iconSize),
          Button_GUI.getButton(
              iconSize, icon, catalog: 'Powers', buttonType: ButtonType.Square, imageSize: 1.0,
              function: (viewModel == null && isPowerChosen) ? null : () => viewModel!.setChosenPower(chosenPower),
              isIconOpacityLowered: isPowerChosen ? false : true
          ),
        ],
      ),
    );
  }

}