import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Moon_GUI{
  static getMoonLayers(BuildContext context, double moonBoxSize) {
    return Container(
      height: moonBoxSize, width: moonBoxSize, //color: Colors.pink,
      child: Image.asset('assets/images/UI/Moon/Moon.png', fit: BoxFit.fill),
    );
  }

}