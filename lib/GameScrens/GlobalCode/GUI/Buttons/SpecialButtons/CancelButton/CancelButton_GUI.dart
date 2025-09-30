import 'package:flutter/cupertino.dart';

import '../../Button_GUI.dart';

class CancelButton_GUI{
  static getCancelButton(double cancelButtonHeight,{
    VoidCallback? function,
    double margin = 0,
  }) {
    return Positioned(
      top: margin, right: margin,
        child: Button_GUI.getButton(
          cancelButtonHeight, 'Cancel',
          imageSize: 0.6,
          function: function
        ),
    );
  }

}