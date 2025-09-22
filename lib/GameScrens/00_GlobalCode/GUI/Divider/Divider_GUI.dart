import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Divider_GUI{
  static Widget getDivider(double width, double height) {
    return Container(
      height: height,width: width, color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset('assets/images/UI/Decorator/GoldFancy_Decorator_Left.png', fit: BoxFit.fill,)),
          Container(
            height: height, width: height,
            child: Image.asset('assets/images/UI/Decorator/GoldFancy_Decorator_Center.png', fit: BoxFit.fill,),
          ),
          Expanded(child: Image.asset('assets/images/UI/Decorator/GoldFancy_Decorator_Right.png', fit: BoxFit.fill,)),
        ],
      ),
    );
  }

}