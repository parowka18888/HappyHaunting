import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/03_Level.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../Data/Database/Enums/UI/Frame/FrameType.dart';
import '../../GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';

class MapPicker_GUI{
  static getMapPickerBox(BuildContext context, double width, double height) {

    LevelSelector_ViewModel levelSelector_ViewModel = context.read<LevelSelector_ViewModel>();
    if(levelSelector_ViewModel.chosenChapter == null) return Container();

    double entyWidth = width;
    double entryHeight = height * 0.4;
    double entryHeight_Activated = height * 0.5;
    double entryPadding = entryHeight * 0.03;

    List<Level> levels = levelSelector_ViewModel.chosenChapter!.levels;
    int itemCount = levels.length;

    return Container(
      height: height, width: width, //color: Colors.green,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          ListView.builder(
              itemCount: itemCount,
              itemBuilder: (context, index){
                Level level = levels[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: entryHeight, width: entyWidth,
                      child: FramedWindow_GUI.getFramedWindow(context, entyWidth, entryHeight,
                        frameType: FrameType.Gold,
                        function: () => getLevelBox(context, entyWidth, entryHeight, level),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: entryPadding)),
                  ],
                );
              })
        ],
      ),
    );
  }

  static getLevelBox(BuildContext context, double width, double height, Level level) {
    return Container(
      height: height, width: width, color: Colors.white,
    );
  }

}