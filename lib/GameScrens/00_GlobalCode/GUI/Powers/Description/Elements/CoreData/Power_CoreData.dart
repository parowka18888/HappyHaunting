import 'package:flutter/cupertino.dart';

import '../../../../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../../../../../Data/Database/DatabaseStructure/01_Power.dart';
import '../../../../Text/TextAndFont.dart';
import '../../../List/PowerList.dart';

class Power_CoreData{
  static getCoreDataBox(BuildContext context, double width, double height, Power power, Ghost ghost) {

    double imageWidth = height;
    double stringsWidth = width - imageWidth;

    return Container(
      height: height, width: width,// color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getCoreData_Image(height, imageWidth, ghost, power),
          getCoreData_PowerStrings(height, stringsWidth, power)
        ],
      ),
    );
  }

  static getCoreData_Image(double height, double imageWidth, Ghost ghost, Power power) {
    return Container(
      height: height, width: imageWidth, child: PowerList.getPowerIcon(imageWidth, ghost, power: power),
    );
  }

  static getCoreData_PowerStrings(double height, double width, Power power) {

    double nameWidth = width;
    double nameHeight = height * 0.4;
    double padding = height * 0.1;
    double additionDataHeight = height - nameHeight - padding;
    double additionDataWidth = width * 0.5;

    return Container(
      height: height, width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: nameWidth, height: nameHeight,
            child: TextAndFont.getText(width, nameHeight, power.name),
          ),
          Padding(padding: EdgeInsets.only(top: padding)),
          Container(width: width, height: additionDataHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getCoreData_PowerString_Category(additionDataHeight, additionDataWidth, 'Energia', power.cost, 'Mana'),
                getCoreData_PowerString_Category(additionDataHeight, additionDataWidth, 'Czas odnowienia', power.cooldown, 'Cooldown'),
              ],
            ),
          ),
        ],
      ),

    );
  }

  static getCoreData_PowerString_Category(double height, double width, String categoryName, double value, String icon) {

    double valueBoxHeight = height * 0.6;
    double valueImageWidth = valueBoxHeight;
    double valueWidth = valueBoxHeight;
    double categoryNameHeight = height - valueBoxHeight;


    return Container(
      height: height, width: width,// color: Colors.deepPurple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: valueBoxHeight, width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: valueBoxHeight, width: valueWidth,
                  child: TextAndFont.getText(valueWidth, valueBoxHeight, value.round().toString()),
                ),
                Container(
                  height: valueBoxHeight, width: valueImageWidth,
                  child: Image.asset('assets/images/UI/Icons/$icon.png',),
                )
              ],
            ),
          ),
          Container(
            height: categoryNameHeight, width: width,
            child: TextAndFont.getText(width, height, categoryName),
          )
        ],
      ),
    );
  }
}