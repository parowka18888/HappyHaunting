import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/FramedWindow/Getter/FramedWindow_Getter.dart';
import 'package:happyhaunting/ViewModels/Haunting/HauntingGame_ViewModel.dart';

import '../../../../GlobalCode/GUI/AnimatedContainer/AnimatedContainer_Getter.dart';
import '../../../../GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';

class DialogWindow_GUI{
  static getDialogScreen(BuildContext context, HauntingGame_ViewModel viewModel, double width, double height, double screenWidth, double screenHeight) {

    double textBox_Height = height * 0.5;
    return IgnorePointer(
      ignoring: viewModel.isDialogWindowVisible == true ? false : true,
      child: AnimatedOpacity(
          opacity: viewModel.isDialogWindowVisible == true ? 1.0 : 0.0,
          duration: AnimatedContainer_Getter.getDuration(),
          curve: AnimatedContainer_Getter.getCurve(),
        child: Container(
          height: screenHeight, width: screenWidth,
          child: Stack(
            alignment: Alignment(0, 0),
            children: [
              FramedWindow_GUI.getFramedWindow(context, width, textBox_Height, function: () => getDialogWindow(viewModel, FramedWindow_Getter.getNewSize(width), FramedWindow_Getter.getNewSize(textBox_Height))),
            ],
          ),
        ),

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