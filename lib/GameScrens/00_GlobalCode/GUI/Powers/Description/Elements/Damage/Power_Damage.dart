import 'package:flutter/cupertino.dart';

import '../../../../../../../Data/Database/DatabaseStructure/01_Power.dart';
import '../../../../../../../Data/Database/Enums/Stats/Getter/Statistic_Getter.dart';
import '../../../../../../../Data/Database/Enums/Stats/Statistic.dart';
import '../../../../Text/TextAndFont.dart';

class Power_Damage{
  static getDamageBox(BuildContext context, double width, double height, Power power) {
    double statWidth = width / 6;
    return Container(
      height: height, width: width,// color: Colors.green,
      // child: SingleChildScrollView(
      //  scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getDamageBoxForStat(Statistic.fear, height, statWidth, power),
          getDamageBoxForStat(Statistic.health, height, statWidth, power),
          getDamageBoxForStat(Statistic.madness, height, statWidth, power),
          getDamageBoxForStat(Statistic.emotions, height, statWidth, power),
          getDamageBoxForStat(Statistic.faith, height, statWidth, power),
          getDamageBoxForStat(Statistic.impurity, height, statWidth, power),
        ],
      ),
      // ),
    );
  }

  static getDamageBoxForStat(Statistic statistic, double height, double width, Power power) {
    double imageWidth = width * 0.6;
    double valueWidth = width - imageWidth;

    int value = Statistic_Getter.getPowerValue(statistic, power).round();
    if(value <= 0){
      return Container();
    }
    return Container(
      height: height, width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: valueWidth, height: height,// color: Colors.deepPurpleAccent,
            child: TextAndFont.getText(valueWidth, height, value.toString(), fontSize: height * 0.5, alignment: Alignment.centerRight),
          ),
          Container(width: imageWidth, height: height,// color: Colors.red,
            child: Image.asset(
              'assets/images/UI/Icons/${Statistic_Getter.getStatisticImage(statistic)}.png'
            ),
          ),

        ],
      ),
    );
  }
}