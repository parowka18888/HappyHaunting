import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../00_GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import '../../../../00_GlobalCode/GUI/FramedWindow/Getter/FramedWindow_Getter.dart';

class GhostData_GUI{
  static getGhostDataWindow(BuildContext context, HauntingGame_ViewModel viewModel, double screenWidth, double screenHeight, double ghostData_Width, double ghostData_Height) {
    if(viewModel.chosenGhost != null){
      return FramedWindow_GUI.getFramedWindow(context, viewModel, ghostData_Width, ghostData_Height,
          function: () => getGhostDataStack(context, FramedWindow_Getter.getNewSize(ghostData_Width), FramedWindow_Getter.getNewSize(ghostData_Height)));
    } else {
      return Container();
    }

  }

  static getGhostDataStack(BuildContext context, double width, double height){
    double rightPadding_GhostImage = width * 0.05;
    var viewModel = context.watch<HauntingGame_ViewModel>();
    return Container(
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Container(
            height: height, width: width, color: Colors.amber,
            child: Stack(alignment: Alignment(0, 0),
              children: [
                getBackground(context),
                Positioned(
                    top: 0,
                    right: rightPadding_GhostImage,
                    child: getGhostImage(context, height)
                ),

              ],
            ),
          ),
          ElevatedButton(onPressed: (){
            viewModel.setGameWindow_GhostData(null);
          }, child: Text("EXIT"))
        ],
      ),
    );
  }

  static getBackground(BuildContext context) {
    HauntingGame_ViewModel viewModel = context.watch<HauntingGame_ViewModel>();
    return Image.asset('assets/images/UI/GhostBackground/GhostBackground_Neutral.png', fit: BoxFit.fitHeight,);
    // return Image.asset('assets/images/UI/GhostBackground/GhostBackground_${viewModel.chosenGhost!.color}.png', fit: BoxFit.fitHeight,);
  }

  static getGhostImage(BuildContext context, double height) {
    double ghostHeight = height * 0.8;
    HauntingGame_ViewModel viewModel = context.watch<HauntingGame_ViewModel>();
    return Container(
      height: ghostHeight,
      child: Column(
        children: [
          Expanded(
              child: Image.asset(
                'assets/images/Ghosts/${viewModel.chosenGhost!.image}.png',
                // height: ghostHeight,
                fit: BoxFit.fitHeight,
              )
          ),
        ],
      )
    );
    // return Container(
    //   height: height, color: Colors.amber,
    //     child: Expanded(child: Image.asset('assets/images/Ghosts/ClothesEater.png')),
    // );
  }

}