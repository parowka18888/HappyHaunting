import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Frame/FrameType.dart';

import 'SingleMenuOption_GUI.dart';

class MenuOptions_GUI{
  static getMenuOptions(BuildContext context, double width, double height) {
    double boxHeight = height * 0.9;
    double boxWidth = width * 0.2;
    double padding = boxWidth * 0.2;
    return Container(
      height: height, width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            //PLAY
            SingleMenuOption_GUI.getMenuOption(context, boxWidth, boxHeight, FrameType.GoldFancy),
            Padding(padding: EdgeInsets.only(left: padding)),
            // GHOSTS
            SingleMenuOption_GUI.getMenuOption(context, boxWidth, boxHeight, FrameType.GoldFancy),
            //STORE
        ],
      ),
    );
  }

}