import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/AnimatedContainer/AnimatedContainer_Getter.dart';
import 'package:happyhaunting/ViewModels/Haunting/HauntingGame_ViewModel.dart';
import 'package:provider/provider.dart';

class LoadingScreen_GUI{
  static getLoadingScreen(BuildContext context, double height, double width) {
    HauntingGame_ViewModel viewModel = context.watch<HauntingGame_ViewModel>();

    bool isVisible = !viewModel.isGameLoaded;
    return IgnorePointer(
      ignoring: !isVisible,
      child: AnimatedOpacity(
          opacity: isVisible ? 1.0 : 0.0,
          duration: AnimatedContainer_Getter.getDuration(),
          curve: AnimatedContainer_Getter.getCurve(),
          child: Container(
            height: height, width: width, color: Colors.lightGreen,
            child: CircularProgressIndicator(),
          ),
      )
    );
  }

}