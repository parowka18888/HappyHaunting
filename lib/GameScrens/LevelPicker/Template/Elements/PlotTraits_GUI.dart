import 'package:flutter/cupertino.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/11_Expansion.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseChapter_Getter.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseExpansion__Getter.dart';

import '../../../../Data/Database/DatabaseStructure/12_Chapter.dart';
import '../../../GlobalCode/GUI/Buttons/Button_GUI.dart';
import '../../../GlobalCode/GUI/Text/TextAndFont.dart';

class PlotTraits_GUI{
  static getPlotTraitsBox(double size, double circleTileHeight, {
    Expansion? expansion,
    Chapter? chapter
  }) {
    double padding = size * 0.1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // if(expansion != null)
        // getSingleExpansionNumber(size, expansion.chapters.length, "ROZDZIAŁY", padding, circleTileHeight),
        if(chapter != null || expansion != null)
        getSingleExpansionNumber(size,
            expansion != null ? DatabaseExpansion__Getter.getExpansionGhostsNumber(expansion) :
            chapter != null ? DatabaseChapter_Getter.getChapterGhostsNumber(chapter) :
                0
            , "DUCHY", padding, circleTileHeight),
        // getSingleExpansionNumber(size, 10, circleTitleHeight, "DUCHY"),
        // getSingleExpansionNumber(size, 10, circleTitleHeight, "OCENA"),
      ],
    );
  }

  static getSingleExpansionNumber(double size, int value, String title, double padding, double titleHeight) {
    return Container(
      height: size + titleHeight, width: size + padding,// color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: size, width: size, //color: Colors.blue,
              child: Button_GUI.getButton(size, '', text: value.toString())
          ),
          Container(
            height: titleHeight, width: size,// color: Colors.deepPurple,
            child: TextAndFont.getText(size, titleHeight, title),
          )
        ],
      ),
    );
  }
}