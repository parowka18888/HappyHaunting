import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Frame/FrameType.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';

class SingleMenuOption_GUI{
  static getMenuOption(BuildContext context, double width, double height, String image, Animation<double> animation,
  {
    Function()? function,
  }
      ) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          width: width, height: height,
          child: GestureDetector(
            onTap: (){
              if(function != null){
                function();
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.translate(
                  offset: Offset(0, animation.value),
                  child: FramedWindow_GUI.getFramedWindow( context, width, height, frameType: FrameType.GoldFancy,
                    function: () => getMenuOptionStack(context, width, height, image),
                  ),
                ),
              ],
            ),
          )
        );
      },
    );
  }

  static getMenuOptionStack(BuildContext context, double width, double height, String image){
    return Container(
      height: height, width: width, color: Colors.amber,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Positioned.fill(child: Image.asset('assets/images/UI/Cards/$image.png',fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}