import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/11_Expansion.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/12_Chapter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:provider/provider.dart';

import '../../../Data/Database/Enums/UI/Frame/FrameType.dart';
import '../../../ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import '../../GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import '../Template/LevelPickerTemplateBackground.dart';

class ChapterPicker_GUI{
  getLevelPickerBox(BuildContext context, double width, double height) {

    LevelSelector_ViewModel levelSelector_ViewModel = context.read<LevelSelector_ViewModel>();
    double entyWidth = width;
    double entryHeight = height * 0.4;
    double entryHeight_Activated = height * 0.5;
    double entryPadding = entryHeight * 0.03;

    Expansion? expansion = levelSelector_ViewModel.chosenExpansion;
    if(expansion == null) {
      return Container();
    }
    int itemCount = expansion.chapters.length;

    return Container(
      height: height, width: width, //color: Colors.green,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          ListView.builder(
              itemCount: itemCount,
              itemBuilder: (context, index){
                Chapter chapter = expansion.chapters[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: entryHeight, width: entyWidth,
                      child: FramedWindow_GUI.getFramedWindow(context, entyWidth, entryHeight,
                        frameType: FrameType.Gold,
                        function: () => getChapterBox(context, entyWidth, entryHeight, chapter),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: entryPadding)),
                  ],
                );
              }),
        ],
      ),
    );
  }

  getChapterBox(BuildContext context, double width, double height, Chapter chapter) {
    return Container(
      height: height, width: width, color: Colors.blue,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          LevelPickerTemplateBackground.getBackground(width, height, chapter.backgroundImage, 'UI/ExpansionPicker/'),

        ],
      ),
    );
  }

}