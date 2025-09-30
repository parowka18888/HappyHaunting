import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/AnimatedContainer/AnimatedContainer_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Background/BackgroundPattern.dart';
import 'package:provider/provider.dart';

import '../../../Data/Database/DatabaseStructure/11_Expansion.dart';
import '../../../ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import '../../GlobalCode/GUI/Buttons/Button_GUI.dart';
import '../../GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';

class LevelPickerTemplate_GUI{
  static getLevelPickerTemplate(BuildContext context, double width, double height,{
    Widget Function()? function,
    isActive = true,
    bool canPop = false
  }) {

    LevelSelector_ViewModel levelSelector_ViewModel = context.read<LevelSelector_ViewModel>();
    Expansion? expansion = levelSelector_ViewModel.chosenExpansion;

    double buttonSize = height * 0.15;
    double bottomPadding = height * 0.15;
    return AnimatedPositioned(
      duration: AnimatedContainer_Getter.getDuration(),
      curve: AnimatedContainer_Getter.getCurve(),
      bottom: isActive ? bottomPadding : - height,
        child: Container(
          height: height, width: width, //color: Colors.green,
          child: Stack(
            alignment: Alignment(0, 0),
            children: [
              BackgroundPattern.getBackgroundPatter(width),
              FramedWindow_GUI.getFramedWindow(context, width, height, backgroundOpacity: 0.7,
              function: function
              ),
              if(expansion != null && canPop)
              Positioned(
                  top: 0, left: 0,
                  child: Button_GUI.getButton(buttonSize, 'ArrowLeft', function: ()=> levelSelector_ViewModel.setChosenExpansion(null))
              )
            ],
          ),
    ));
  }

}