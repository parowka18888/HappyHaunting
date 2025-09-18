import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/FramedWindow/Getter/FramedWindow_Getter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';

class FramedWindow_GUI{

  static double cornerSize = 7;
  static double framePadding = cornerSize * 0.37;

  static getFramedWindow(BuildContext context, HauntingGame_ViewModel viewModel, double width, double height,{
    Widget Function()? function,
  }) {
    return Container(
      width: width, height: height,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          getBackground(width, height),
          if(function != null)
            function(),
          getFrame(width, height),
        ],
      ),
    );
  }

  static getBackground(double width, double height) {
    double scaledPadding = FramedWindow_Getter.getScaledValue_Padding(framePadding, width, height);
    return Container(
      width: width - (scaledPadding), height: height - (scaledPadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(2, 14, 31, 1),
          Color.fromRGBO(3, 11, 30, 1),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
        ),
      )
    );
  }

  static getFrame(double width, double height) {
    double scaledCornerSize =  FramedWindow_Getter.getScaledValue_CornerSize(cornerSize, width, height);
    return Container(
      width: width, height: height,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: scaledCornerSize, height: scaledCornerSize,
                    child: Image.asset('assets/images/UI/Frame/Gold/Corner_TopLeft.png', fit: BoxFit.fitHeight),
                  ),
                  Expanded(child: Container(height: scaledCornerSize,
                    child: Image.asset('assets/images/UI/Frame/Gold/Line_Top.png', fit: BoxFit.fill),
                  )),
                  Container(width: scaledCornerSize, height: scaledCornerSize,
                    child: Image.asset('assets/images/UI/Frame/Gold/Corner_TopRight.png', fit: BoxFit.fitHeight),
                  ),
                ],
              ),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: scaledCornerSize, height: height,
                    child: Image.asset('assets/images/UI/Frame/Gold/Line_Left.png', fit: BoxFit.fill),
                  ),
                  Expanded(child: Container()),
                  Container(width: scaledCornerSize, height: height,
                    child: Image.asset('assets/images/UI/Frame/Gold/Line_Right.png', fit: BoxFit.fill),
                  ),
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: scaledCornerSize, height: scaledCornerSize,
                    child: Image.asset('assets/images/UI/Frame/Gold/Corner_BottomLeft.png', fit: BoxFit.fitHeight),
                  ),
                  Expanded(child: Container(height: scaledCornerSize,
                    child: Image.asset('assets/images/UI/Frame/Gold/Line_Bottom.png', fit: BoxFit.fill),
                  )),
                  Container(width: scaledCornerSize, height: scaledCornerSize,
                    child: Image.asset('assets/images/UI/Frame/Gold/Corner_BottomRight.png', fit: BoxFit.fitHeight),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

}