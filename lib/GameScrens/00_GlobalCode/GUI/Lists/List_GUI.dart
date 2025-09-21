import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Button/ButtonType.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import 'package:hive/hive.dart';

import '../../../../Data/Database/DatabaseStructure/00_Ghost.dart';

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

    double framePadding = width * 0.1;

    double listHeight = height - 2 * framePadding;
    double listWidth = width - 2 * framePadding;

    int itemsInLine = 4;
    double itemPadding = framePadding * 0.2;
      double areaForItems = listWidth - (itemPadding * itemsInLine - 1);

    double itemSize = areaForItems / itemsInLine;

    Box box_Ghosts = Hive.box<Ghost>('ghosts');
    int itemsCount = box_Ghosts.length;

    return Container(
      height: height, width: width,// color: Colors.green,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Container(
            height: listHeight, width: listWidth, //color: Colors.amber,
            child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: itemPadding,
                mainAxisSpacing: itemPadding,
                children: List.generate(itemsCount, (index) {
                  Ghost ghost = box_Ghosts.getAt(index);
                  return Container(
                    height: itemSize, width: itemSize,
                    //color: Colors.blue,
                    child: Button_GUI.getButton(itemSize, ghost.icon, catalog: 'Ghosts', buttonType: ButtonType.Square),
                  );
                }),

            )
          )
        ],
      ),
    );
  }

}