import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Screen/GUI/SidePanel/SidePanel_ByCategory/Mortals/Panel/MortalPanel_GUI.dart';

import '../../../../../Haunting_Game/Haunting_Game.dart';
import '../../../../../ViewModel/HauntingGame_ViewModel.dart';

class MortalsList_GUI{
  static getMortalsList(BuildContext context, HauntingGame_ViewModel viewModel, double height, double width, Haunting_Game game) {
    if(viewModel.isGameLoaded == true){
      List<Haunting_Mortal> mortals = game.level.mortals.where((mortal) => mortal.isActive == true).toList();
      mortals.sort((a, b) {
        if (a.isDefeated == b.isDefeated) return 0;
        if (a.isDefeated) return 1;
        return -1;
      });
      int itemCount = mortals.length;
      double itemHeight = height / 4;
      return Container(
        height: height, width: width, color: Colors.amber,
        child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context, index){
              Haunting_Mortal mortal = mortals[index];
              return MortalPanel_GUI.getMortalPanel(context, width, itemHeight, viewModel, mortal);
            }),
      );
    } else {
      return Container();
    }
  }
}