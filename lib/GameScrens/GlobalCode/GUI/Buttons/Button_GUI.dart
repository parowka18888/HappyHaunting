import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Button/ButtonType.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Background/Background.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Getter/Button_Getter.dart';

class Button_GUI{
  static getButton(double size, String icon, {
    String catalog = "UI/Icons",
    VoidCallback? function,
    bool isOpacityLowered = false,
    ButtonType buttonType = ButtonType.Circle,
    bool isActive = true,
    String? overWrittenBackground,
    double imageSize = 1.0
  }) {
    String iconPath = 'assets/images/${catalog}/$icon.png';
    String background = 'assets/images/UI/Buttons/${buttonType.name}Button.png';
    if(overWrittenBackground != null) background = 'assets/images/UI/Buttons/${overWrittenBackground}.png';
    String frame = 'assets/images/UI/Buttons/${buttonType.name}Button_Frame.png';
    String shade = 'assets/images/UI/Buttons/${buttonType.name}Button_Shade.png';


    return GestureDetector(
      onTap: (){
        if(function != null){
          function();
        }
      },
      child: AnimatedContainer(duration: Duration(milliseconds: 500), curve: Curves.easeInOut,
          height: size, width: size,
          child: Stack(alignment: Alignment(0, 0),
            children: [
              getBackground(background, buttonType),
              // Image.asset(background, fit: BoxFit.fill,),
              // Background.getBackgroundShade(size, size, opacity: 0.25),
              getImage(buttonType, isOpacityLowered, iconPath, size * imageSize),
              Image.asset(shade, fit: BoxFit.fill,),
              Image.asset(frame, fit: BoxFit.fill,),
            ],
          ),
      )
    );
  }

  static getImage(ButtonType buttonType, bool isOpacityLowered, String iconPath, double size) {
    switch(buttonType){
      case ButtonType.Circle:
        return ClipOval(
            child: getAnimatedImage(size * 0.75, iconPath, isOpacityLowered)
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

}