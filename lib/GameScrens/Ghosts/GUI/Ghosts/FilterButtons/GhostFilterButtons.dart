import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Getter/Statistic_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Statistic.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Getter/ScaledUI.dart';
import 'package:provider/provider.dart';

import '../../../../../ViewModels/Selector/GhostSelector_ViewModel.dart';
import '../../../../GlobalCode/GUI/Buttons/Button_GUI.dart';

class GhostFilterButtons{
  static getFilterButtons(BuildContext context, double width, double height) {

    GhostSelector_ViewModel viewModel = context.watch<GhostSelector_ViewModel>();
    List<Statistic> ghostTypes = [Statistic.fear, Statistic.health, Statistic.madness, Statistic.emotions, Statistic.faith, Statistic.impurity];
    double padding = height * 0.1;
    double buttonHeight = ScaledUI.getScaledHeight(width, height, padding, ghostTypes.length);
    double modifiedHeight = buttonHeight * 0.7;

    return Container(
      width: width, height: height,// color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          ghostTypes.length,
              (i) => Padding(
                padding: i == 0 ? EdgeInsets.only(left: 0) : EdgeInsets.only(left: padding),
                child: getSingleFilterButton(viewModel, ghostTypes[i], buttonHeight, modifiedHeight),
              ),
        ),
      ),
    );
  }

  static getSingleFilterButton(GhostSelector_ViewModel viewModel, Statistic type, double defaultHeight, double modifiedHeight) {
    return Button_GUI.getButton(
        viewModel.chosenGhostTypes.contains(type) ? defaultHeight : modifiedHeight,
        Statistic_Getter.getStatisticImage(type),
        isOpacityLowered: viewModel.chosenGhostTypes.contains(type) ? false : true,
        function: () => viewModel.toggleFilter(type));
  }

}