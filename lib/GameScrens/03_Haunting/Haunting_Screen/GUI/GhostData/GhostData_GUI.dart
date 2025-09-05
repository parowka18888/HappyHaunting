import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';

class GhostData_GUI{
  static getGhostDataWindow(BuildContext context, HauntingGame_ViewModel viewModel, double screenWidth, double screenHeight, double ghostData_Width, double ghostData_Height) {
    return Container(
      height: screenHeight, width: screenWidth, color: Colors.black54,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Container(
            height: ghostData_Height, width: ghostData_Width, color: Colors.amber,
            child: Stack(alignment: Alignment(0, 0),
              children: [
                getBackground(context)
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
    return Image.asset('assets/images/UI/GhostBackground/GhostBackground_Blue.png', fit: BoxFit.fitHeight,);
  }

}