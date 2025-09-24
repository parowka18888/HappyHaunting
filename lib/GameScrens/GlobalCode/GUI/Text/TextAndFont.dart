import 'dart:ui';

import 'package:flame/text.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';

class TextAndFont{
  static getText(double width, double height, String string, {
    double? fontSize,
    Alignment alignment = Alignment.center
  }) {
    if(fontSize == null) fontSize = height;

    return SizedBox(
        width: width, height: height,
        child: Align( alignment: alignment,
          child: AutoSizeText(
            string,
            minFontSize: 5,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,

            ),
          ),
        ),
    );
  }

}