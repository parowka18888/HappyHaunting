import 'package:flutter/cupertino.dart';

class Background{
  static getBackground(double screenWidth, double screenHeight) {
    return Container(
      height: screenHeight, width: screenWidth,
      child: Image.asset('assets/images/UI/Background/Background_NightSky.png', fit: BoxFit.cover,),
    );
  }

  static getBackgroundShade(double screenWidth, double screenHeight) {
    return Container(
      height: screenHeight, width: screenWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromRGBO(2, 14, 31, 0.15),
              Color.fromRGBO(3, 11, 30, 0.15),
            ],
        )
      ),
    );
  }

  static getBackgroundLayers(double screenWidth, double screenHeight) {
    return Container(
      height: screenHeight, width: screenWidth,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          getBackground(screenWidth, screenHeight),
          getBackgroundShade(screenWidth, screenHeight)
        ],
      ),
    );
  }

}