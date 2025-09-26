import 'package:flutter/cupertino.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Frame/FrameDecorator.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Decorator/Decorator_Getter.dart';

class Decorator_GUI{
  static getDecorator(double height, FrameDecorator type) {
    return Container(
      height: height,
      child: Image.asset(Decorator_Getter.getDecoratorImageByType(type)),
    );
  }
  
}