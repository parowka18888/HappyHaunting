import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';

class PickerTitle_GUI{
  static getTitle(double width, double height, String title) {
    return TextAndFont.getText(width, height, title);
  }

}