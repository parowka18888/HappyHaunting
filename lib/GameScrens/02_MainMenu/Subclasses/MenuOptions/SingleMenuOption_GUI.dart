import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Frame/FrameType.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';

class SingleMenuOption_GUI{
  static getMenuOption(BuildContext context, double width, double height, FrameType type) {

    return Container(
      width: width, height: height, color: Colors.deepPurple,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          FramedWindow_GUI.getFramedWindow(context, width, height, frameType: type)
        ],
      ),
    );
  }

}