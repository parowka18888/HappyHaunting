import 'dart:ui';

import 'package:flame/text.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';

class TextAndFont{
  static getText(double width, double height, String string) {
    return SizedBox(
        width: width, height: height,
        child: AutoSizeText(
          string,
          textAlign: TextAlign.center,
          minFontSize: 8,
          style: TextStyle(
            fontSize: height,
            color: Colors.white
          ),
        )
    );
  }

}