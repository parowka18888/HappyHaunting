import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Powers/Checker/PowersGUI_CheckConditions.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/AnimatedContainer/AnimatedContainer_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Getter/ScaledUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Settings/Tiers/TierStats_Getter.dart';

import '../../../../../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../../../../../../Data/Database/DatabaseStructure/01_Power.dart';
import '../../../../../../../GlobalCode/GUI/Text/TextAndFont.dart';
import '../../../List/PowerList.dart';

class Power_CoreData{
  static getCoreDataBox(BuildContext context, double width, double height, Power power, Ghost ghost) {

    // double imageBoxWidth = width * 0.3;
    // double imageWidth = ScaledUI.getScaledHeight(imageBoxWidth, height, 0, 1);
    double stringsWidth = width;

    return Container(
      height: height, width: width, //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // getCoreData_Image(imageWidth, imageWidth, ghost, power),
          getCoreData_PowerStrings(height, stringsWidth, power)
        ],
      ),
    );
  }

  // static getCoreData_Image(double height, double imageWidth, Ghost ghost, Power power) {
  //   return Container(
  //     height: height, width: imageWidth, child: PowerList.getPowerIcon(imageWidth, ghost, power: power),
  //   );
  // }

  static getCoreData_PowerStrings(double height, double width, Power power) {

    double itemCount = 4;
    // if(power.powerTime > 0) itemCount++;
    // if(power.powerChances < 100) itemCount++;

    double nameWidth = width;
    double nameHeight = height * 0.35;
    double padding = height * 0.1;

    double additionDataHeight = height - nameHeight - padding;
    double additionDataWidth = width / itemCount;

    return Container(
      height: height, width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: nameWidth, height: nameHeight, //color: Colors.green,
            child: TextAndFont.getText(width, nameHeight, power.name),
          ),
          Padding(padding: EdgeInsets.only(top: padding)),
          Container(width: width, height: additionDataHeight,// color: Colors.deepPurple,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getCoreData_PowerString_Category(additionDataHeight, additionDataWidth, 'Energia', power.cost, 'Mana'),
                getCoreData_PowerString_Category(additionDataHeight, additionDataWidth, 'Czas odnowienia', power.cooldown, 'Cooldown'),
                getCoreData_PowerString_Category(additionDataHeight, additionDataWidth, 'Czas trwania', power.powerTime, 'Cooldown', isVisible: PowersGUI_CheckConditions.checkIfPowerTimeIsAvailable(power.powerTime)),
                getCoreData_PowerString_Category(additionDataHeight, additionDataWidth, 'Skuteczność', power.powerChances, 'Cooldown', isVisible: PowersGUI_CheckConditions.checkIfPowerChanceIsAvailable(power.powerChances)),
              ],
            ),
          ),
        ],
      ),

    );
  }

  static getCoreData_PowerString_Category(double height, double width, String categoryName, double value, String icon, {
    bool isVisible = true,
    double modifiedValue = 0
  }) {

    double valueBoxHeight = height * 0.6;
    double categoryNameHeight = height - valueBoxHeight;

    double boxWidth = ScaledUI.getScaledHeight(width, valueBoxHeight, 0, 2);
    double valueImageWidth = boxWidth;
    double valueWidth = boxWidth;


    return AnimatedOpacity(
      opacity: isVisible ? 1 : 0.25,
      duration: AnimatedContainer_Getter.getDuration(),
      child: AnimatedContainer(
        duration: AnimatedContainer_Getter.getDuration(),
        curve: AnimatedContainer_Getter.getCurve(),
        height: height,
        width: isVisible ? width : 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: valueBoxHeight, width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: valueBoxHeight, width: isVisible ? valueWidth : 0,// color: Colors.blue,
                    child: TextAndFont.getText(valueWidth, valueBoxHeight, '${value.round().toString()}${modifiedValue > 0 ? "(TO DO)" : ""}', alignment: Alignment.centerRight),
                  ),
                  Container(
                    height: valueBoxHeight, width: valueImageWidth,// color: Colors.green,
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
      ),
    );
  }
}