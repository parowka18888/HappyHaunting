import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/ViewModels/Haunting/HauntingGame_ViewModel.dart';

class MortalData_GUI{
  static getMortalDataWindow(BuildContext context, HauntingGame_ViewModel viewModel, double screenWidth, double screenHeight, double ghostData_Width, double ghostData_Height) {
    return Container(
      height: ghostData_Height,
      width: ghostData_Width,
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Name ${viewModel.chosenMortal!.name}"),
          Text("Aktywne bufy: ${viewModel.chosenMortal!.effects.length}"),
          ElevatedButton(onPressed: (){
            viewModel.setGameWindow_MortalData(null);
          }, child: Text("Exit"))
        ],
      ),
    );
  }

}