import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Frame/FrameType.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import 'package:happyhaunting/GameScrens/MainMenu/Subclasses/Logo/Logo_GUI.dart';

class MenuBanner_GUI{
  static getMenuBanner(BuildContext context, double width, double height, double boxHeight) {
    return Container(
      width: width, height: height, //color: Colors.amber,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Container(
            width: width, height: boxHeight, color: Colors.deepPurple,
            child: FramedWindow_GUI.getFramedWindow(context, width, boxHeight, frameType: FrameType.GoldFancy, function: () => getMenuBannerBox(context, width, boxHeight)),
          )
          // getMenuBannerBox(context, width, boxHeight)
        ],
      ),
    );
  }

  static getMenuBannerBox(BuildContext context, double width, double height) {
    double logoPadding = height * 0.4;
    return Container(
      width: width, height: height,
      child: Stack(alignment: Alignment(0, 0),
        children: [
          getBackground(context, width, height),
          Positioned(
            left: logoPadding,
              child: Logo_GUI.getLogo(context, height, height)),
          Positioned(
              right: 0,
              child: getGhostImage(context, width, height)),
        ],
      )
    );
  }

  static getBackground(BuildContext context, double width, double height) {
    return Container(
      height: height, width: width,
      child: Image.asset(
        'assets/images/UI/GhostBackground/GhostBackground_Expansion_1.png',
        fit: BoxFit.fitWidth,
        alignment: Alignment(0, -0.3),
      ),
    );
  }

  static getGhostImage(BuildContext context, double width, double height) {
    return Transform.translate(
      offset: Offset(width * 0.25, 0),
      child: Container(
        height: height, width: width,
        child: Image.asset(
          'assets/images/Ghosts/Spider.png',
          fit: BoxFit.fitWidth,
          alignment: Alignment(0, -0.6),
        ),
      ),
    );
  }

}