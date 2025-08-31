import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Screen/GUI/SidePanel/SidePanel_ByCategory/Mortals/Panel/MortalPanel_GUI.dart';

import '../../../../../Haunting_Game/Haunting_Game.dart';
import '../../../../../ViewModel/HauntingGame_ViewModel.dart';

class MortalsList_GUI{
  static getMortalsList(BuildContext context, HauntingGame_ViewModel viewModel, double height, double width, Haunting_Game game) {
    if(viewModel.isGameLoaded == true){
      int itemCount = game.level.mortals.length;
      double itemHeight = height / 4;
      return Container(
        height: height, width: width, color: Colors.amber,
        child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context, index){
              Haunting_Mortal mortal = game.level.mortals[index];
              return MortalPanel_GUI.getMortalPanel(context, width, itemHeight, viewModel, mortal);
            }),
      );
    } else {
      return Container();
    }
  }
}