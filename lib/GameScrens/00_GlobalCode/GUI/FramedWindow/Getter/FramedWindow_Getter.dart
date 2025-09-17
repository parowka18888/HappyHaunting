import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';

class FramedWindow_Getter{
  static double getScaledValue_CornerSize(double value, double width, double height) {
    if(width < value * 2 || height < value * 2){
      double scaleFactor = (width < height ? width : height) / (value * 2);
      return value * scaleFactor;
    }
    return value;
  }

  static double getScaledValue_Padding(double value, double width, double height) {
    if(width < value * 2 || height < value * 2){
      double scaleFactor = (width < height ? width : height) / (value * 2);
      return (value * scaleFactor) * 0.2;
    }
    return value;
  }

  static double getNewSize(double size) {
    return size - FramedWindow_GUI.framePadding;
  }

}