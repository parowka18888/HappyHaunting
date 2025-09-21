import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class DedicatedArea_GUI{
  static getDedicatedArea(BuildContext context,
      double areaWidth, double areaHeight,
      Widget Function()? function

      ) {
    return Container(
      width: areaWidth, height: areaHeight, //color: Colors.deepPurple,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          if(function != null)
            function()
        ],
      ),
    );
  }

}