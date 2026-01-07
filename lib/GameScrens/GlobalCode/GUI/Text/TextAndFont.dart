import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
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
    int maxLines = 50,
    double minFontSize = 5,
    double maxFontSize = 100000,
    bool isFramed = true
  }) {
    if(fontSize == null) fontSize = height;

    var fontStyle = GoogleFonts.alegreyaSc(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    var outlineStyle = fontStyle.copyWith(
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = Colors.black,
    );


    return SizedBox(
        width: width, height: height,
        child: Align( alignment: alignment,
          child: Stack(
            children: [
              if(isFramed == true)
              AutoSizeText(
                tr(string),
                minFontSize: minFontSize,
                maxFontSize: maxFontSize,
                maxLines: maxLines,
                textAlign: TextAlign.justify,
                style: outlineStyle,
              ),
              AutoSizeText(
                tr(string),
                minFontSize: minFontSize,
                maxFontSize: maxFontSize,
                maxLines: maxLines,
                textAlign: TextAlign.justify,
                style: fontStyle,
              ),
            ],
          )
        ),
    );
  }

}