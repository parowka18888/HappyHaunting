import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Window/GhostSelector/GhostSelector_WindowMode.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/AnimatedContainer/AnimatedContainer_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Getter/Button_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import 'package:happyhaunting/ViewModels/Selector/Ghost/GhostSelector_ViewModel.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_CheckConditions.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import 'package:provider/provider.dart';

class TeamPicker_Buttons_GUI{

  static getTeamPickerButtons(BuildContext context, double height, double width) {
    LevelSelector_ViewModel levelSelector_ViewModel = context.watch<LevelSelector_ViewModel>();
    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();

    double ghostButton_Height = height;
    double additionalButton_Height = height * 0.6;

    // dodawanie, randomizacja, tryb multiplikowany
    return Container(
      height: height, width: width, //color: Colors.lightGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          getAdditionButton(context,additionalButton_Height,
              'Randomise',
                  () => levelSelector_ViewModel.randomiseTeam()
          ),
          getManageTeamButton(context, ghostButton_Height,),
          getAdditionButton(context,additionalButton_Height,
              'Clear',
                  () => levelSelector_ViewModel.clearTeam()
          ),
          // getAdditionButton(context,additionalButton_Height,
          //   'CheatMode',
          //   levelSelector_ViewModel.isMultipliedGhostsModeOn,
          //     () => levelSelector_ViewModel.toggleIsMultipliedGhostsMode()
          // )
        ],
      ),
    );
  }

  static getManageTeamButton(BuildContext context, double height,) {
    LevelSelector_ViewModel levelSelector_ViewModel = context.watch<LevelSelector_ViewModel>();
    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    bool canBeAdded = LevelSelector_CheckConditions.checkIfGhostCanBeAddedToTeam(ghostSelector_ViewModel.chosenGhost, levelSelector_ViewModel);

    bool isButtonCentered = !LevelSelector_CheckConditions.checkIfTeamIsFinal(levelSelector_ViewModel);
    height = isButtonCentered ? height : height * 0.7;
    double opacity = isButtonCentered ? 1.0 : 0.7;
    return AnimatedContainer(
      duration: AnimatedContainer_Getter.getDuration(),
      curve: AnimatedContainer_Getter.getCurve(),
      height: height, width: height,// color: Colors.yellow,
      child: Button_GUI.getButton(height,
        ghostSelector_ViewModel.chosenGhost == null ? 'EmptySlot' :
        levelSelector_ViewModel.isMultipliedGhostsModeOn ? 'ArrowDown' :
        canBeAdded ? 'ArrowDown' : 'ArrowUp',
        function: () {
          levelSelector_ViewModel.manageGhostInTeam(ghostSelector_ViewModel.chosenGhost);
          if(LevelSelector_CheckConditions.checkIfTeamIsFinal(levelSelector_ViewModel)){
            ghostSelector_ViewModel.setWindowMode(GhostSelector_WindowMode.play);
          }
        },
        opacity: opacity
      ),
    );
  }

  static getAdditionButton(BuildContext context, double height, String icon, VoidCallback? function) {

    return AnimatedContainer(
      duration: AnimatedContainer_Getter.getDuration(),
      curve: AnimatedContainer_Getter.getCurve(),
      height: height, width: height,
      child: Button_GUI.getButton(
          height,
          icon,
          function: function,
          opacity: 1
      ),
    );
  }

}