import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/FramedWindow/Getter/FramedWindow_Getter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';

import '../../../../00_GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';

class DialogWindow_GUI{
  static getDialogScreen(BuildContext context, HauntingGame_ViewModel viewModel, double width, double height, double screenWidth, double screenHeight) {

    double textBox_Height = height * 0.5;

    return Container(
      height: screenHeight, width: screenWidth, color: Colors.black54,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          FramedWindow_GUI.getFramedWindow(context, viewModel, width, textBox_Height, function: () => getDialogWindow(viewModel, FramedWindow_Getter.getNewSize(width), FramedWindow_Getter.getNewSize(textBox_Height))),
        ],
      ),
    );
  }

  static getDialogWindow(HauntingGame_ViewModel viewModel, double width, double height){
    return Container(
      width: width, height: height, color: Colors.deepPurple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(viewModel.dialogWindow_Text != null)
            Text(viewModel.dialogWindow_Text!),
          ElevatedButton(onPressed: (){viewModel.setIsDialogWindowVisible(false);}, child: Text("Zamknij"))
        ],
      ),
    );
  }

}