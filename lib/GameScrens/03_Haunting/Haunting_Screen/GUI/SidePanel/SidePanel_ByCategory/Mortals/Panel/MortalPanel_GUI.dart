import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Tags/Power/05_PowerTag.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';

class MortalPanel_GUI{
  static getMortalPanel(BuildContext context, double width, double height, HauntingGame_ViewModel viewModel, Haunting_Mortal mortal) {

    double bars_Width = width * 0.5;
    double bars_Height = height * 0.9;
    return Container(
      height: height, width: width,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          //BACKGROUND
          //MORTAL IMAGE
          Positioned(top: 0, left: 0, child: getMortalImage(width, height, mortal, viewModel)),
          //STATS
          Positioned(right: 0, child: getMortalBars(bars_Width, bars_Height, mortal, viewModel)),
          //FEAR
          Positioned(left: 0, child: getMortalFear(mortal, viewModel)),

        ],
      ),
    );
  }

  static getMortalImage(double width, double height, Haunting_Mortal mortal, HauntingGame_ViewModel viewModel) {
    return Container(
        height: height,
        child: Opacity(opacity: mortal.isDefeated == false ? 1.0 : 0.5,
          child: Image.asset('assets/images/Mortals/${mortal.icon}.png', fit: BoxFit.fitHeight,),
        )
    );
  }

  static getMortalStats(double width, double height, Haunting_Mortal mortal, HauntingGame_ViewModel viewModel) {
    return Container(
      height: height, width: width, color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${mortal.stat_Current_Health} / ${mortal.stat_Health}"),
          Text("${mortal.stat_Current_Fear} / ${mortal.stat_Fear}"),
          Text("${mortal.stat_Current_Madness} / ${mortal.stat_Madness}"),
          Text("${mortal.stat_Current_Faith} / ${mortal.stat_Faith}"),
        ],
      ),
    );
  }

  static getMortalBars(double width, double height, Haunting_Mortal mortal, HauntingGame_ViewModel viewModel) {
    double paddingHeight = height * 0.08;
    double bar_Height = (height - paddingHeight * 5) / 4;

    return Container(
      height: height, width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: paddingHeight)),
          getMortalBar_ByStat(width, bar_Height, mortal.stat_Current_Health, mortal.stat_Health, "Red"),
          Padding(padding: EdgeInsets.only(top: paddingHeight)),
          getMortalBar_ByStat(width, bar_Height, mortal.stat_Current_Fear, mortal.stat_Fear, "Purple"),
          Padding(padding: EdgeInsets.only(top: paddingHeight)),
          getMortalBar_ByStat(width, bar_Height, mortal.stat_Current_Madness, mortal.stat_Madness, "Yellow"),
          Padding(padding: EdgeInsets.only(top: paddingHeight)),
          getMortalBar_ByStat(width, bar_Height, mortal.stat_Current_Faith, mortal.stat_Faith, "Blue"),
          Padding(padding: EdgeInsets.only(top: paddingHeight)),
        ],
      ),
    );
  }

  static getMortalBar_ByStat(double width, double height, double currentValue, double maxValue, String color) {
    double factor = (currentValue / maxValue);
    if(factor < 0 ) factor = 0;

    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment(-1, 0),
        children: [
          Image.asset(
            'assets/images/UI/Bars/LongBar_Background.png',
            fit: BoxFit.fill,
            height: height,
            width: width,
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: factor,
              child: Image.asset(
                'assets/images/UI/Bars/LongBar_${color}.png',
                fit: BoxFit.fill,
                height: height,
                width: width,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static getMortalFear(Haunting_Mortal mortal, HauntingGame_ViewModel viewModel) {
    String fear = "?";
    if(mortal.isFearUnlocked == true){
      print("JEST ODBLOKOWANE");
      fear = mortal.fear.toString();
    } else {
      print("NIE JEST ODBLOKOWANE ${mortal.isFearUnlocked}");
    }
    return Text(fear);
  }

}