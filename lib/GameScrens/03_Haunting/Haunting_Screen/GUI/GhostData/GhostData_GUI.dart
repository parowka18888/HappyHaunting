import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';
import 'package:provider/provider.dart';

class GhostData_GUI{
  static getGhostDataWindow(BuildContext context, HauntingGame_ViewModel viewModel, double screenWidth, double screenHeight, double ghostData_Width, double ghostData_Height) {
    double rightPadding_GhostImage = ghostData_Width * 0.05;
    if(viewModel.chosenGhost != null){
      return Container(
        height: screenHeight, width: screenWidth, color: Colors.black54,
        child: Stack(
          alignment: Alignment(0, 0),
          children: [
            Container(
              height: ghostData_Height, width: ghostData_Width, color: Colors.amber,
              child: Stack(alignment: Alignment(0, 0),
                children: [
                  getBackground(context),
                  Positioned(
                      top: 0,
                      right: rightPadding_GhostImage,
                      child: getGhostImage(context, ghostData_Height)
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
    } else {
      return Container();
    }

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