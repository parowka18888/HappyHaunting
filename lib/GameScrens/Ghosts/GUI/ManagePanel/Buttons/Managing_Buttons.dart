import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Window/GhostSelector/GhostSelector_WindowMode.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Getter/ScaledUI.dart';
import 'package:happyhaunting/ViewModels/Selector/GhostSelector_ViewModel.dart';
import 'package:provider/provider.dart';

class Managing_Buttons{
  static getManagingButtons(BuildContext context, double width, double height) {
    GhostSelector_ViewModel viewModel = context.watch<GhostSelector_ViewModel>();
    double padding = height * 0.1;
    double buttonHeight = ScaledUI.getScaledHeight(width, height, padding, 3);
    double modifiedHeight = buttonHeight * 0.7;
    return Container(
      height: height, width: width, //color: Colors.black54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // POWERS
          getSingleManageButton(viewModel, GhostSelector_WindowMode.powers, buttonHeight, modifiedHeight, 'Powers'),
          Padding(padding: EdgeInsets.only(left: padding)),

          //GHOST INTRODUCTION
          getSingleManageButton(viewModel, GhostSelector_WindowMode.introduction, buttonHeight, modifiedHeight, 'Ghost'),
          Padding(padding: EdgeInsets.only(left: padding)),

          //UPGRADING
          getSingleManageButton(viewModel, GhostSelector_WindowMode.upgrade, buttonHeight, modifiedHeight, 'Upgrade'),
        ],
      ),
    );
  }

  static getSingleManageButton(GhostSelector_ViewModel viewModel, GhostSelector_WindowMode mode, double defaultHeight, double modifiedHeight, String icon) {
    return Button_GUI.getButton(
        viewModel.windowMode == mode ? defaultHeight : modifiedHeight,
        icon,
        isIconOpacityLowered: viewModel.windowMode == mode ? false : true,
        function: () => viewModel.setWindowMode(mode));
  }

}