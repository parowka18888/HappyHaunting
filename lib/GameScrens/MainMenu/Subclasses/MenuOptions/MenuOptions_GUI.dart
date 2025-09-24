import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Frame/FrameType.dart';

import '../../../GlobalCode/Navigator/AppNavigator.dart';
import '../../../Ghosts/GhostsScreen.dart';
import '../../../LevelPicker/LevelPicker.dart';
import 'SingleMenuOption_GUI.dart';

class MenuOptions_GUI{
  static getMenuOptions(BuildContext context, double width, double height,
      double boxHeight, double boxWidth, double padding, List<Animation<double>> anims) {
    return Container(
      height: height, width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            //PLAY
            SingleMenuOption_GUI.getMenuOption(context, boxWidth, boxHeight, 'Card_Play', anims[0], function: () => AppNavigator.navigateToScreen(context, LevelPicker())),
            Padding(padding: EdgeInsets.only(left: padding)),
            // GHOSTS
            SingleMenuOption_GUI.getMenuOption(context, boxWidth, boxHeight, 'Card_Ghosts', anims[1], function: () => AppNavigator.navigateToScreen(context, GhostsScreen())),
            Padding(padding: EdgeInsets.only(left: padding)),
            //STORE
            SingleMenuOption_GUI.getMenuOption(context, boxWidth, boxHeight, 'Card_Store', anims[2]),
        ],
      ),
    );
  }

}