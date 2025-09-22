import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Frame/FrameType.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/FramedWindow/Getter/FramedWindow_Getter.dart';
import 'package:happyhaunting/GameScrens/ViewModels/Haunting/HauntingGame_ViewModel.dart';
import 'package:provider/provider.dart';

class FramedWindow_GUI{

  static double cornerSize = 7;
  static double framePadding = cornerSize * 0.37;

  static getFramedWindow(BuildContext? context, double width, double height,{
    Widget Function()? function,
    FrameType frameType = FrameType.GoldFancy,
    double backgroundOpacity = 1.0
  }) {

    return Container(
      width: width, height: height,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          getBackground(width, height, backgroundOpacity),
          if(function != null)
            function(),
          getFrame(width, height, frameType),
        ],
      ),
    );
  }

  static getBackground(double width, double height, double backgroundOpacity) {
    return Container(
      width: width, height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(2, 14, 31, backgroundOpacity),
          Color.fromRGBO(3, 11, 30, backgroundOpacity),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
        ),
      )
    );
  }

  static getFrame(double width, double height, FrameType frameType) {

    double cornerSize = FramedWindow_Getter.getCornerSize(frameType);
    double scaledCornerSize =  FramedWindow_Getter.getScaledValue_CornerSize(cornerSize, width, height);
    double lineWidth = width - 2 * scaledCornerSize;
    double lineHeight_Vertical = height - 2 * scaledCornerSize;
    double singleLineHeight_Vertical = (lineHeight_Vertical / 2) * 0.8;
    double singleLineWidth = (lineWidth / 2) * 0.8;

    return IgnorePointer(
      ignoring: true,
      child: Container(
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
                      child: Image.asset('assets/images/UI/Frame/${frameType.name}/Corner_TopLeft.png', fit: BoxFit.fitHeight),
                    ),
                    Container(width: singleLineWidth, height: scaledCornerSize,
                      child: Image.asset('assets/images/UI/Frame/${frameType.name}/Line_TopLeft.png', fit: BoxFit.fill),
                    ),
                    Expanded(child: Container()),
                    Container(width: singleLineWidth, height: scaledCornerSize,
                      child: Image.asset('assets/images/UI/Frame/${frameType.name}/Line_TopRight.png', fit: BoxFit.fill),
                    ),
                    Container(width: scaledCornerSize, height: scaledCornerSize,
                      child: Image.asset('assets/images/UI/Frame/${frameType.name}/Corner_TopRight.png', fit: BoxFit.fitHeight),
                    ),
                  ],
                ),
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: scaledCornerSize, height: lineHeight_Vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(width: scaledCornerSize, height: singleLineHeight_Vertical,
                              child: Image.asset('assets/images/UI/Frame/${frameType.name}/Line_LeftTop.png', fit: BoxFit.fill),
                            ),
                            Expanded(child: Container()),
                            Container(width: scaledCornerSize, height: singleLineHeight_Vertical,
                              child: Image.asset('assets/images/UI/Frame/${frameType.name}/Line_LeftBottom.png', fit: BoxFit.fill),
                            ),
                          ],
                        )
                    ),
                    Expanded(child: Container()),
                    Container(width: scaledCornerSize, height: lineHeight_Vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(width: scaledCornerSize, height: singleLineHeight_Vertical,
                              child: Image.asset('assets/images/UI/Frame/${frameType.name}/Line_RightTop.png', fit: BoxFit.fill),
                            ),
                            Expanded(child: Container()),
                            Container(width: scaledCornerSize, height: singleLineHeight_Vertical,
                              child: Image.asset('assets/images/UI/Frame/${frameType.name}/Line_RightBottom.png', fit: BoxFit.fill),
                            ),
                          ],
                        )
                    ),
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: scaledCornerSize, height: scaledCornerSize,
                      child: Image.asset('assets/images/UI/Frame/${frameType.name}/Corner_BottomLeft.png', fit: BoxFit.fitHeight),
                    ),
                    Container(width: singleLineWidth, height: scaledCornerSize,
                      child: Image.asset('assets/images/UI/Frame/${frameType.name}/Line_BottomLeft.png', fit: BoxFit.fill),
                    ),
                    Expanded(child: Container()),
                    Container(width: singleLineWidth, height: scaledCornerSize,
                      child: Image.asset('assets/images/UI/Frame/${frameType.name}/Line_BottomRight.png', fit: BoxFit.fill),
                    ),
                    Container(width: scaledCornerSize, height: scaledCornerSize,
                      child: Image.asset('assets/images/UI/Frame/${frameType.name}/Corner_BottomRight.png', fit: BoxFit.fitHeight),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}