import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Resource/Getter/Resource_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Resource/Resource.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/CheckConditions/GhostTier_CheckConditions.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/Getter/GhostTier_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/Getter/UpgradePrice_Getter.dart';
import 'package:happyhaunting/Data/Database/Setters/Ghost/DatabaseGhost_Setter.dart';
import 'package:happyhaunting/GameScrens/Ghosts/Mechanics/Upgrade/GhostUpgrade.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/ViewModels/Selector/GhostSelector_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../../Data/Database/DatabaseStructure/00_Ghost.dart';

class UpgradePrice_GUI{

  static double bigCircleModifier = 0.45;
  static double smallCircleModifier = 0.3;

  static getUpgradePriceBox(BuildContext context, double width, double height) {

    GhostSelector_ViewModel viewModel = context.watch<GhostSelector_ViewModel>();
    Ghost? ghost = viewModel.chosenGhost;

    double bottomPriceLineHeight = height * 0.2;
    double smallerDimension = height;
    if(width < height) smallerDimension = width;
    smallerDimension = smallerDimension * 0.9;

    if(ghost == null) return Container();
    bool ghostCanBeUpgraded = GhostTier_CheckConditions.checkIfGhostCanBeUpgraded(ghost);

    return Container(
      height: height, width: width,// color: Colors.blue,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Positioned(top: (smallerDimension * bigCircleModifier) * 0.5,
            child: getResourceCirclesBox(smallerDimension, ghost, ghostCanBeUpgraded, viewModel)),
          Positioned(bottom: 0, child: getBottomPriceLine(width, bottomPriceLineHeight, ghost, ghostCanBeUpgraded))
        ],
      ),
    );
  }

  static getResourceCirclesBox(double smallerDimension, Ghost ghost, bool ghostCanBeUpgraded, GhostSelector_ViewModel viewModel) {
    double bigCircleSize = smallerDimension * bigCircleModifier;
    double smallCircleSize = smallerDimension * smallCircleModifier;

    double BigCenter_X = (smallerDimension - bigCircleSize) / 2;
    double BigCenter_Y = (smallerDimension - bigCircleSize) / 2;

    double bigR = bigCircleSize / 2;
    double smallR = smallCircleSize / 2;
    double smallPadding = smallCircleSize * 0.1;


    double bottomPaddingContainer = (smallCircleSize - smallPadding) / smallerDimension * 0.5;
    return Stack(
      alignment: Alignment(0, 0),
      children: [
        Button_GUI.getButton(bigCircleSize, 'ArrowUp',
            isActive: ghostCanBeUpgraded ? true : false,
            opacity: ghostCanBeUpgraded ? 1.0 : 0.3,
            function: () => GhostUpgrade.upgradeGhost(ghost),
            ghostSelector_ViewModel: viewModel
        ),
        getSingleResourceButton(-(smallR + bigR + smallPadding), 0, smallCircleSize, Resource.faith, modifierX: -1, ghost),
        getSingleResourceButton((smallR + bigR + smallPadding), 0, smallCircleSize, Resource.impurity, modifierX: 1, ghost),
        getSingleResourceButton((smallR + bigR + smallPadding) * 0.75, -(smallR * 2), smallCircleSize, Resource.health, modifierX: 1, ghost),
        getSingleResourceButton(-(smallR + bigR + smallPadding) * 0.75, -(smallR * 2), smallCircleSize, Resource.fear, modifierX: -1, ghost),
        getSingleResourceButton(-(smallR + bigR + smallPadding) * 0.75, (smallR * 2), smallCircleSize, Resource.madness, modifierX: -1, ghost),
        getSingleResourceButton((smallR + bigR + smallPadding) * 0.75, (smallR * 2), smallCircleSize, Resource.emotions, modifierX:  1, ghost),

      ],
    );
  }

  static getSingleResourceButton(double x, double y, double size, Resource resource, Ghost ghost, {
    double modifierX = 0,
    double modifierY = 0
  }) {
    double modifiedSize = size * 0.8;
    int resourcePrice = UpgradePrice_Getter.getUpgradePrice(resource, ghost);
    bool isActive = resourcePrice > 0 ? true : false;
    return Transform.translate(
        offset: Offset(x, y),
        child: Stack(
          alignment: Alignment(0, 0),
          children: [
            Button_GUI.getButton(
                size, Resource_Getter.getResourceImage(resource), catalog: 'UI/Currency',
                opacity: isActive ? 1.0 : 0.4
            ),
            if(resourcePrice > 0)
            Transform.translate(
                offset: Offset(modifiedSize * modifierX, modifiedSize * modifierY),
              child: TextAndFont.getText(size, size, resourcePrice.toString(), fontSize: size * 0.5),
            )

          ],
        )
    );
  }

  static getBottomPriceLine(double width, double height, Ghost ghost, bool ghostCanBeUpgraded) {
    double goldWidth = width * 0.3;
    double hintWidth = width - goldWidth;

    return Container(
      height: height, width: width,// color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height, width: goldWidth, child: getSingleResourceButton(0, 0, height, Resource.gold, ghost, modifierX: 1), alignment: Alignment.centerLeft,
          ),
          Container(
            height: height, width: hintWidth,
            child: TextAndFont.getText(width, height,
                ghostCanBeUpgraded ?
                "Aby ulepszyć ducha za wymagane zasoby naciśnij centralny przycisk."
                    : "Nie stac Cię na ulepszenie ducha. Wróć po kolejnych nawiedzeniach."
            ),
          ),

        ],
      ),
    );
  }

}