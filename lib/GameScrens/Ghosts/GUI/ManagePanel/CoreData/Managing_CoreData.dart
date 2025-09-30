import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Getter/Statistic_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/Getter/GhostTier_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Button/ButtonType.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Background/Background.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Decorator/Decorator_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Divider/Divider_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Tier/Tier_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Settings/Tiers/TierStats_Getter.dart';
import 'package:happyhaunting/ViewModels/Selector/Ghost/GhostSelector_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../../../Data/Database/Enums/UI/Frame/FrameDecorator.dart';

class Managing_CoreData{

  static double bigCircleModifier = 0.8;

  static getImagesBox(Ghost ghost, double width, double height) {
    double size = height * 0.8;
    double textHeight = height - size;
    double decoratorHeight = height * 0.25;
    double decoratorPadding = (width - size) / 2 + size;
    return Container(
      height: height, width: width,// color: Colors.blue,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Positioned(child: Button_GUI.getButton(size, Statistic_Getter.getStatisticImage(ghost.mainStat),overWrittenBackground: Statistic_Getter.getStatisticBackground(ghost.mainStat))),
          Positioned(
              top: 0, left: decoratorPadding,
              child: Decorator_GUI.getDecorator(decoratorHeight, FrameDecorator.upsideDownRight)),
          Positioned(
              top: 0, right: decoratorPadding,
              child: Decorator_GUI.getDecorator(decoratorHeight, FrameDecorator.upsideDownLeft)),
          Positioned(bottom: 0, child: Container(
            width: width, height: textHeight,// color: Colors.red,
            child: TextAndFont.getText(width, textHeight, "Typ ducha: ${Statistic_Getter.getGhostTypeNameByStatistic(ghost.mainStat)}"),
          ))
        ],
      ),
    );
  }

  static getNameAndDescriptionBox(Ghost ghost, double width, double height) {
    double nameHeight = height * 0.25;
    double detailsHeight = height * 0.175;
    double descriptionHeight = height - nameHeight - detailsHeight;
    return Container(
      height: height, width: width, //color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextAndFont.getText(width, nameHeight, ghost.name),
          TextAndFont.getText(width, descriptionHeight, ghost.health.toString()),
          TextAndFont.getText(width, detailsHeight, 'Zdrowie: ${ghost.health} (${TierStats_Getter.getUpgradedValue_Health(ghost.health, ghost.tier)})'),
        ],
      )
    );
  }

  static getTierBox(Ghost ghost, double width, double height) {
    double size = height * 0.8;
    double textHeight = height - size;
    double decoratorHeight = height * 0.25;
    double decoratorPadding = (width - size) / 2 + size;
    return Container(
      height: height, width: width, //color: Colors.blue,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Positioned(bottom: 0,
              child: Button_GUI.getTierButton(ghost, size),
          ),
          Positioned(
              bottom: 0, left: decoratorPadding,
              child: Decorator_GUI.getDecorator(decoratorHeight, FrameDecorator.right)),
          Positioned(
              bottom: 0, right: decoratorPadding,
              child: Decorator_GUI.getDecorator(decoratorHeight, FrameDecorator.left)),
          Positioned(top: 0, child: Container(
            width: width, height: textHeight,// color: Colors.red,
            child: TextAndFont.getText(width, textHeight, "Poziom ducha:"),
          ))
        ],
      ),
    );
  }


}