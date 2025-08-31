import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';

class DialogWindow_GUI{
  static getDialogWindow(BuildContext context, HauntingGame_ViewModel viewModel, double width, double height, double screenWidth, double screenHeight) {

    double textBox_Height = height * 0.4;

    return Container(
      height: screenHeight, width: screenWidth, color: Colors.black54,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Container(
            width: width, height: height, color: Colors.deepPurple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(viewModel.dialogWindow_Text != null)
                Text(viewModel.dialogWindow_Text!),
                ElevatedButton(onPressed: (){viewModel.setIsDialogWindowVisible(false);}, child: Text("Zamknij"))
              ],
            ),
          )
        ],
      ),
    );
  }

}