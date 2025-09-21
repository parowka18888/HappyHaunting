import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Screen/GUI/SidePanel/SidePanel_ByCategory/Mortals/MortalsList_GUI.dart';
import 'package:happyhaunting/GameScrens/ViewModels/Haunting/HauntingGame_ViewModel.dart';

import '../../../../../Data/Database/Enums/GameCategory.dart';
import 'SidePanel_ByCategory/Ghosts/Ghosts_GUI.dart';

class SidePanel_GUI{
  static getSidePanel(BuildContext context, HauntingGame_ViewModel viewModel, double height, double width, Haunting_Game game) {
    if(viewModel.gameCategory == GameCategory.empty){
      return Container();
    }
    return Container(
      height: height, width: width,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(viewModel.gameCategory == GameCategory.ghosts || viewModel.gameCategory == GameCategory.trapped)
            Ghosts_GUI.getGhostList(context, viewModel, height, width, game),
          if(viewModel.gameCategory == GameCategory.mortals)
            MortalsList_GUI.getMortalsList(context, viewModel, height, width, game),
        ],
      ),
    );
  }

  static getSidePanelButton(BuildContext context, HauntingGame_ViewModel viewModel, double height, double width) {
    return Container(width: width, height: height, color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child:
          ElevatedButton(onPressed: (){viewModel.setGameCategory(GameCategory.ghosts) ;print(viewModel.gameCategory);}, child: Text("D")),
          ),
          Expanded(child:
          ElevatedButton(onPressed: (){viewModel.setGameCategory(GameCategory.mortals);print(viewModel.gameCategory);}, child: Text("M")),
          ),
          Expanded(child:
          ElevatedButton(onPressed: (){viewModel.setGameCategory(GameCategory.trapped);print(viewModel.gameCategory);}, child: Text("T")),
          ),

        ],
      ),);
  }

}