import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';

class MortalPanel_GUI{
  static getMortalPanel(BuildContext context, double width, double height, HauntingGame_ViewModel viewModel, Haunting_Mortal mortal) {

    double statsWidth = width * 0.5;
    return Container(
      height: height, width: width,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          //BACKGROUND
          //MORTAL IMAGE
          Positioned(top: 0, left: 0, child: getMortalImage(width, height, mortal, viewModel)),
          //STATS
          Positioned(top: 0, right: 0, child: getMortalStats(statsWidth, height, mortal, viewModel)),

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

}