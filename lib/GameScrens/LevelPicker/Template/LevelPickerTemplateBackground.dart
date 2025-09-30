import 'package:flutter/cupertino.dart';

class LevelPickerTemplateBackground{
  static getBackground(double width, double height, String image, String catalog) {
    return Container(
      height: height, width: width,
      child: Image.asset('assets/images/${catalog}${image}.png', fit: BoxFit.cover,),
    );
  }
  
}