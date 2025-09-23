import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Powers/PowerList.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/GameScrens/ViewModels/GhostSelector/GhostSelector_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../../Data/Database/DatabaseStructure/01_Power.dart';

class PowerDescription{
  static Widget getPowerDescriptionBox(BuildContext context, double width, double height) {

    double coreDataHeight = height * 0.4;
    double descriptionHeight = height * 0.4;
    double damageHeight = height - coreDataHeight - descriptionHeight;
    return Container(
      width: width, height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // IMAGE / NAME, COST, COOLDOWN
          getCoreDataBox(context, width, coreDataHeight),
          //DESCRIPTION
          getDescriptionBox(context, width, descriptionHeight),
          //DAMAGE
          getDamageBox(context, width, damageHeight)
        ],
      ),
    );
  }

  static getCoreDataBox(BuildContext context, double width, double height) {

    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    Ghost? ghost = ghostSelector_ViewModel.chosenGhost;
    Power? power = ghostSelector_ViewModel.chosenPower;

    double imageWidth = height;
    double stringsWidth = width - imageWidth;

    if(power == null || ghost == null){
      return Container();
    }

    return Container(
     height: height, width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getCoreData_Image(height, imageWidth, ghost, power, ghostSelector_ViewModel),
          getCoreData_PowerStrings(height, stringsWidth, power)
        ],
      ),
    );
  }

  static getCoreData_Image(double height, double imageWidth, Ghost ghost, Power power, GhostSelector_ViewModel ghostSelector_ViewModel) {
    return Container(
      height: height, width: imageWidth, child: PowerList.getPowerIcon(imageWidth, ghost, ghostSelector_ViewModel, power: power),
    );
  }

  static getCoreData_PowerStrings(double height, double width, Power power) {

    double nameWidth = width;
    double nameHeight = height * 0.4;
    double additionDataHeight = height - nameHeight;
    double additionDataWidth = width * 0.5;

    return Container(
      height: height, width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: nameWidth, height: nameHeight,
            child: TextAndFont.getText(width, nameHeight, power.name),
          ),
          Container(width: width, height: additionDataHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getCoreData_PowerString_Category(additionDataHeight, additionDataWidth, 'Czas odnowienia', power.cooldown, 'Cooldown'),
                getCoreData_PowerString_Category(additionDataHeight, additionDataWidth, 'Energia', power.cost, 'Mana'),
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
      height: height, width: width,
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
                  child: Image.asset('assets/images/UI/Icons/$icon.png'),
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

  static getDescriptionBox(BuildContext context, double width, double height) {
    return Container(
      height: height, width: width, color: Colors.deepPurpleAccent,
    );
  }

  static getDamageBox(BuildContext context, double width, double height) {
    return Container(
      height: height, width: width, color: Colors.green,
    );
  }

}