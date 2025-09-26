import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Background/Background.dart';

class SidePanelTemplate{
  static getFirstSegment(BuildContext context, double width, double height) {
    return Container(
      height: height, width: width, //color: Colors.purple,
    );
  }

  static getSecondSegment(BuildContext context, double width, double height, double availableWidth) {
    double decoratorWidth = width * 0.15;
    return Container(
      height: height, width: width, //color: Colors.purple,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Background.getBackgroundShade(width, height),
          Positioned(
              left: 0,
              child: Container(
                width: decoratorWidth,
                child: Image.asset('assets/images/UI/Decorator/TextDecorator_Left.png'),
              )),
          Positioned(
              right: 0,
              child: Container(
                width: decoratorWidth,
                child: Image.asset('assets/images/UI/Decorator/TextDecorator_Right.png'),
              )),
        ],
      ),
    );
  }

  static getThirdSegment(BuildContext context, double width, double height) {
    return Container(
      height: height, width: width, //color: Colors.purple,
    );
  }


}