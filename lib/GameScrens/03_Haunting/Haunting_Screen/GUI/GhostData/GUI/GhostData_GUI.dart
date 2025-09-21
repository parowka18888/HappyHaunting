import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Screen/GUI/GhostData/GUI/GhostData_GUI_BackgroundLayer.dart';
import 'package:happyhaunting/GameScrens/ViewModels/Haunting/HauntingGame_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../../00_GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import '../../../../../00_GlobalCode/GUI/FramedWindow/Getter/FramedWindow_Getter.dart';

class GhostData_GUI{
  static getGhostDataWindow(BuildContext context, HauntingGame_ViewModel viewModel, double screenWidth, double screenHeight, double ghostData_Width, double ghostData_Height) {
    if(viewModel.chosenGhost != null){
      return FramedWindow_GUI.getFramedWindow(context, ghostData_Width, ghostData_Height,
          function: () => getGhostDataStack(context, FramedWindow_Getter.getNewSize(ghostData_Width), FramedWindow_Getter.getNewSize(ghostData_Height)));
    } else {
      return Container();
    }

  }

  static getGhostDataStack(BuildContext context, double width, double height){
    var viewModel = context.watch<HauntingGame_ViewModel>();
    return Container(
      width: width, height: height,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          GhostData_GUI_BackgroundLayer.getGhostData_Images(context, height, width),
          ElevatedButton(onPressed: (){
            viewModel.setGameWindow_GhostData(null);
          }, child: Text("EXIT"))
        ],
      ),
    );
  }



}