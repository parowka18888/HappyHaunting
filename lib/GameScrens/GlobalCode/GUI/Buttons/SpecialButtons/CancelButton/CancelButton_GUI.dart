import 'package:flutter/cupertino.dart';

import '../../Button_GUI.dart';

class CancelButton_GUI{
  static getCancelButton(double screenHeight,{
    VoidCallback? function,
    double? margin,
  }) {
    //CANCEL BUTTON
    double cancelButtonHeight = screenHeight * 0.1;
    if(margin == null) margin =  cancelButtonHeight * 0.2;

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