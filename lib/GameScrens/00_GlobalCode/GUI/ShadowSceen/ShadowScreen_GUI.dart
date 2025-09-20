import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShadowScreen_GUI{
  static getShadowScreen(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth, height: screenHeight,
      color: Colors.black87
    );
  }

}