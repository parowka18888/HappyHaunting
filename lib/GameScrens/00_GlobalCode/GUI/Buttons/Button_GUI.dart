import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button_GUI{
  static getButton(double size, String icon, {
    String? pathIcon,
    VoidCallback? function
  }) {
    String iconPath = 'assets/images/UI/Icons/$icon.png';
    if(pathIcon != null){
      iconPath = pathIcon;
    }
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
            Image.asset('assets/images/UI/Buttons/CircleButton.png', fit: BoxFit.fitHeight,),
            Image.asset(iconPath, height: size * 0.8),
            Image.asset('assets/images/UI/Buttons/CircleButton_Frame.png', fit: BoxFit.fitHeight,),
          ],
        ),
      ),
    );
  }

}