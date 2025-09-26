import 'dart:ui';

import 'package:flame/text.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

class TextAndFont{
  static getText(double width, double height, String string, {
    double? fontSize,
    Alignment alignment = Alignment.center,
    int maxLines = 50
  }) {
    if(fontSize == null) fontSize = height;

    var fontStyle = GoogleFonts.alegreyaSc(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    return SizedBox(
        width: width, height: height,
        child: Align( alignment: alignment,
          child: AutoSizeText(
            string,
            minFontSize: 5,
            maxLines: maxLines,
            textAlign: TextAlign.justify,
            style: fontStyle,
          ),
        ),
    );
  }

}