import 'package:flutter/cupertino.dart';

import '../../../../../../../Data/Database/DatabaseStructure/01_Power.dart';
import '../../../../../../GlobalCode/GUI/Text/TextAndFont.dart';

class Power_Description{
  static getDescriptionBox(BuildContext context, double width, double height, Power power) {
    double fontSize = height * 0.3;
    return Container(
      height: height, width: width,// color: Colors.deepPurpleAccent,
      child: TextAndFont.getText(width, height, power.description, fontSize: fontSize),
    );
  }
}