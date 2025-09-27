import 'package:flutter/cupertino.dart';

class BackgroundPattern{
  static getBackgroundPatter(double width) {
    return Positioned(
        bottom: 0,
        child: Opacity(opacity: 0.35,
        child: Container(
            width: width,
            child: Image.asset('assets/images/UI/Background/Background_Pattern.png', fit: BoxFit.fitWidth,)
        ),
        )
    );
  }

}