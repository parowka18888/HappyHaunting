import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/CheckConditions/GhostTier_CheckConditions.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/Getter/GhostTier_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Settings/Tiers/TierModifier_Getter.dart';
import 'package:happyhaunting/ViewModels/Selector/Ghost/GhostSelector_ViewModel.dart';

class UpgradeValues_GUI{
  static getUpgradeValues(GhostSelector_ViewModel ghostSelector_ViewModel, double width, double height) {
    int itemCount = 4; //DAMAGE, TIME OF POWER, CHANCE, HEALTH
    double  itemHeight = height / itemCount;
    double categoryNameWidth = width * 0.4;
    double arrowWidth = width * 0.1;
    double valueWidth = (width - categoryNameWidth - arrowWidth) / 2;

    Ghost? ghost = ghostSelector_ViewModel.chosenGhost;
    if(ghost == null || GhostTier_CheckConditions.checkIfGhostIsTopTier(ghost)) return Container();

    GhostTier currentTier = ghost.tier;
    GhostTier? nextTier = GhostTier_Getter.getNextGhostTier(currentTier);
    if(nextTier == null) return Container();

    return Container(
      height: height, width: width,// color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getCategory(width, itemHeight, categoryNameWidth, arrowWidth, valueWidth,
              'Obrażenia:', TierModifier_Getter.getTierModifier_Damage(currentTier), TierModifier_Getter.getTierModifier_Damage(nextTier)
          ),
          getCategory(width, itemHeight, categoryNameWidth, arrowWidth, valueWidth,
              'Zdrowie:', TierModifier_Getter.getTierModifier_Health(currentTier), TierModifier_Getter.getTierModifier_Health(nextTier)
          ),
          getCategory(width, itemHeight, categoryNameWidth, arrowWidth, valueWidth,
              'Skuteczność:', TierModifier_Getter.getTierModifier_Chance(currentTier), TierModifier_Getter.getTierModifier_Chance(nextTier)
          ),
          getCategory(width, itemHeight, categoryNameWidth, arrowWidth, valueWidth,
              'Czas trwania:', TierModifier_Getter.getTierModifier_TimeOfPower(currentTier), TierModifier_Getter.getTierModifier_TimeOfPower(nextTier)
          ),
        ],
      ),
    );
  }

  static getCategory(
      double width, double height,
      double categoryNameWidth, double arrowWidth, double valueWidth,
      String categoryName, double currentValue, double nextValue) {
    return Container(
      height: height, width: width,// color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //CATEGORY NAME
          Container(
            height: height, width: categoryNameWidth,// color: Colors.red,
            child: TextAndFont.getText(categoryNameWidth, height, categoryName, alignment: Alignment.centerLeft),
          ),
          //VALUE
          Container(
            height: height, width: valueWidth,// color: Colors.blue,
            child: TextAndFont.getText(categoryNameWidth, height, '${currentValue}%'),
          ),
          //ARROW
          Container(
            height: height, width: arrowWidth,// color: Colors.yellow,
            child: Image.asset('assets/images/UI/Icons/ArrowRight.png'),
          ),
          //VALUE
          Container(
            height: height, width: valueWidth,// color: Colors.blue,
            child: TextAndFont.getText(categoryNameWidth, height, '${nextValue}%'),
          ),
        ],
      ),
    );
  }

}