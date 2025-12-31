import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class DedicatedArea_GUI{

  static Random random = Random();

  static getDedicatedArea(BuildContext context,
      double areaWidth, double areaHeight,
      Widget Function()? function,
      {
        double? paddingTop
      }
      ) {
    List<Color> list = [
      Colors.amber, Colors.blue, Colors.pink, Colors.deepPurple, Colors.green, Colors.red, Colors.yellow, Colors.blueGrey, Colors.lightGreenAccent
    ];
    int index = 0 + random.nextInt(list.length);


    return Container(
      width: areaWidth, height: areaHeight,// color: list[index],
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          if(function != null)
            Positioned(top: paddingTop, child: function())

        ],
      ),
    );
  }

}