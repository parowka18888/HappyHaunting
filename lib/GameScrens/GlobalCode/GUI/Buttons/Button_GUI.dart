import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/Getter/GhostTier_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Button/ButtonType.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/AnimatedContainer/AnimatedContainer_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Background/Background.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Getter/Button_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Tier/Tier_GUI.dart';
import 'package:happyhaunting/ViewModels/Haunting/HauntingGame_ViewModel.dart';

import '../../../../Data/Database/Enums/Tier/CheckConditions/GhostTier_CheckConditions.dart';
import '../../../../ViewModels/Selector/GhostSelector_ViewModel.dart';

class Button_GUI{
  static getButton(double size, String icon, {
    String catalog = "UI/Icons",
    VoidCallback? function,
    bool isIconOpacityLowered = false,
    ButtonType buttonType = ButtonType.Circle,
    bool isActive = true,
    String? overWrittenBackground,
    double imageSize = 0.7,
    double opacity = 1.0,
    GhostSelector_ViewModel? ghostSelector_ViewModel,
    HauntingGame_ViewModel? haunting_ViewModel,
  }) {
    String iconPath = 'assets/images/${catalog}/$icon.png';
    String background = 'assets/images/UI/Buttons/${buttonType.name}Button.png';
    if(overWrittenBackground != null) background = 'assets/images/UI/Buttons/${overWrittenBackground}.png';
    String frame = 'assets/images/UI/Buttons/${buttonType.name}Button_Frame.png';
    String shade = 'assets/images/UI/Buttons/${buttonType.name}Button_Shade.png';


    return GestureDetector(
      onTap: (){
        if(function != null && isActive == true){
          function();
          if(ghostSelector_ViewModel != null) ghostSelector_ViewModel.refresh();
          if(haunting_ViewModel != null) haunting_ViewModel.refresh();

        }
      },
      child: AnimatedOpacity(
        opacity: opacity,
        duration: AnimatedContainer_Getter.getDuration(),
        curve: AnimatedContainer_Getter.getCurve(),
        child: AnimatedContainer(duration: Duration(milliseconds: 500), curve: Curves.easeInOut,
          height: size, width: size,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(buttonType == ButtonType.Circle ? size / 2 : 0),
            child: Stack(alignment: Alignment(0, 0),
              children: [
                getBackground(background, buttonType),
                // // // Image.asset(background, fit: BoxFit.fill,),
                // // // Background.getBackgroundShade(size, size, opacity: 0.25),
                getImage(buttonType, isIconOpacityLowered, iconPath, size * imageSize),
                Image.asset(shade, fit: BoxFit.fill,),
                Image.asset(frame, fit: BoxFit.fill,),
              ],
            ),
          )
        ),
      )
    );
  }

  static getImage(ButtonType buttonType, bool isOpacityLowered, String iconPath, double size) {
    switch(buttonType){
      case ButtonType.Circle:
        return getAnimatedImage(size, iconPath, isOpacityLowered);
        return ClipOval(
            child: getAnimatedImage(size, iconPath, isOpacityLowered)
        );
      case ButtonType.Square:
        return getAnimatedImage(size, iconPath, isOpacityLowered);
    }
  }

  static getAnimatedImage(double size, String iconPath, bool isOpacityLowered) {
    return AnimatedOpacity(opacity: isOpacityLowered ? 0.5 : 1.0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 750),
        curve: Curves.easeInOut,
        height: size,
        child: Image.asset(iconPath),
      ),
    );
  }

  static getBackground(String background, ButtonType buttonType) {
    switch(buttonType){
      case ButtonType.Circle:
        return ClipOval(
          child: Image.asset(
            background,
            fit: BoxFit.fill,
          ),
        );
      case ButtonType.Square:
        return Image.asset(
          background,
          fit: BoxFit.fill,
        );
    }
  }

  static getTierButton(Ghost ghost, double ghostTierSize,{
    GhostTier? tier,
  }) {
    if(tier == null) tier = ghost.tier;
    return getButton(ghostTierSize, GhostTier_Getter.getTierImage(tier),
        catalog: 'UI/Tiers',
        imageSize: 0.5,
        opacity: GhostTier_CheckConditions.checkIfGhostReachedLevel(ghost, tier) ? 1.0 : 0.5,
    );
  }

}