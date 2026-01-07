import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/AnimatedContainer/AnimatedContainer_Getter.dart';

class Moon_GUI{
  static getMoonLayers(BuildContext context, double moonBoxSize, {double opacity = 1.0}) {
    return AnimatedOpacity(
        opacity: opacity,
        duration: AnimatedContainer_Getter.getDuration() * 2,
      curve: AnimatedContainer_Getter.getCurve(),
      child: Container(
        height: moonBoxSize, width: moonBoxSize, //color: Colors.pink,
        child: Image.asset('assets/images/UI/Moon/Moon.png', fit: BoxFit.fill),
      ),
    );
  }

}