import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';

class List_GUI{
  static getListLayers(BuildContext context, double width, double height) {
    return Container(
      height: height, width: width,// color: Colors.pink,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          FramedWindow_GUI.getFramedWindow(
              context, width, height,
            function: () => getList(context, height, width)
          )
        ],
      ),
    );
  }

  static getList(BuildContext context, double height, double width) {
    return Container(
      height: height, width: width, color: Colors.green,
    );
  }

}