import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/GhostView/Ghost_GUI.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Moon/Moon_GUI.dart';

class GhostView_GUI{
  static getGhostViewLayer(BuildContext context, double width, double height) {

    double moonBoxSize = height * 0.8;


    return Container(
      height: height, width: width,color: Colors.amber,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          //MOON
          Positioned(top: 0, child: Moon_GUI.getMoonLayers(context, moonBoxSize)),
          //GHOST IMAGE
          Positioned(top: 0, child: Ghost_GUI.getGhostImage(context, height, width)),
        ],
      ),
    );
  }


}