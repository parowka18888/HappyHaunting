import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Button/ButtonType.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Buttons/Getter/Button_Getter.dart';

class Button_GUI{
  static getButton(double size, String icon, {
    String catalog = "UI/Icons",
    VoidCallback? function,
    bool isOpacityLowered = false,
    ButtonType buttonType = ButtonType.Circle
  }) {

    String iconPath = 'assets/images/${catalog}/$icon.png';

    String background = 'assets/images/UI/Buttons/${buttonType.name}Button.png';
    String frame = 'assets/images/UI/Buttons/${buttonType.name}Button_Frame.png';
    String shade = 'assets/images/UI/Buttons/${buttonType.name}Button_Shade.png';


    return GestureDetector(
      onTap: (){
        if(function != null){
          function();
        }
      },
      child: Container(
        height: size, width: size,
        child: Stack(alignment: Alignment(0, 0),
          children: [
            Image.asset(background, fit: BoxFit.fill,),
            ClipOval(
              child: Opacity(
                opacity: isOpacityLowered ? 0.5 : 1.0,
                child: Image.asset(
                  iconPath,
                  height: size * 0.8,
                ),
              ),
            ),
            Image.asset(shade, fit: BoxFit.fill,),
            Image.asset(frame, fit: BoxFit.fill,),
          ],
        ),
      ),
    );
  }

}