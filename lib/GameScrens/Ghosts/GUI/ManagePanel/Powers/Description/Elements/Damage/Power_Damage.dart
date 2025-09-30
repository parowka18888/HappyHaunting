import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Powers/Getter/PowerGUI_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Getter/ScaledUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Settings/Tiers/TierStats_Getter.dart';
import 'package:happyhaunting/ViewModels/Selector/Ghost/GhostSelector_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../../../../../../Data/Database/DatabaseStructure/01_Power.dart';
import '../../../../../../../../Data/Database/Enums/Stats/Getter/Statistic_Getter.dart';
import '../../../../../../../../Data/Database/Enums/Stats/Statistic.dart';
import '../../../../../../../GlobalCode/GUI/Text/TextAndFont.dart';

class Power_Damage{
  static getDamageBox(BuildContext context, double width, double height) {
    GhostSelector_ViewModel viewModel = context.watch<GhostSelector_ViewModel>();
    Power? power = viewModel.chosenPower;
    Ghost? ghost = viewModel.chosenGhost;

    if(power == null || ghost == null) return Container();

    double itemCount = PowerGUI_Getter.getStatItemCount(power);
    double statWidth = width / itemCount;

    return Container(
      height: height, width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getDamageBoxForStat(Statistic.fear, height, statWidth, power, ghost),
          getDamageBoxForStat(Statistic.health, height, statWidth, power, ghost),
          getDamageBoxForStat(Statistic.madness, height, statWidth, power, ghost),
          getDamageBoxForStat(Statistic.emotions, height, statWidth, power, ghost),
          getDamageBoxForStat(Statistic.faith, height, statWidth, power, ghost),
          getDamageBoxForStat(Statistic.impurity, height, statWidth, power, ghost),
        ],
      ),
      // ),
    );
  }

  static getDamageBoxForStat(Statistic statistic, double height, double width, Power power, Ghost ghost) {
    double imageWidth = width * 0.5;
    double valueWidth = width - imageWidth;

    int value = Statistic_Getter.getPowerValue(statistic, power).round();
    if(value <= 0){
      return Container();
    }
    int tierModifier = TierStats_Getter.getUpgradedValue_Damage(value, ghost.tier);
    return Container(
      height: height, width: width,// color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: valueWidth, height: height,// color: Colors.deepPurpleAccent,
            child: TextAndFont.getText(valueWidth, height, '${value} (${tierModifier.round()})', fontSize: height * 0.5, alignment: Alignment.centerRight, maxLines: 1),
          ),
          Container(width: imageWidth, height: height,// color: Colors.red,
            child: Image.asset(
              'assets/images/UI/Icons/${Statistic_Getter.getStatisticImage(statistic)}.png',
              alignment: Alignment.centerLeft,
            ),
          ),

        ],
      ),
    );
  }
}