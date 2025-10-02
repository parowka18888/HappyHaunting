import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/11_Expansion.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/12_Chapter.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Frame/FrameDecorator.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/AnimatedContainer/AnimatedContainer_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Decorator/Decorator_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Divider/Divider_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/GameScrens/LevelPicker/Template/Elements/PlotTraits_GUI.dart';
import 'package:happyhaunting/GameScrens/LevelPicker/Template/Elements/Title/PickerTitle_GUI.dart';
import 'package:provider/provider.dart';

import '../../../Data/Database/Enums/UI/Frame/FrameType.dart';
import '../../../ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import '../../GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import '../Template/LevelPickerTemplateBackground.dart';

class ChapterPicker_GUI{
  static getChapterPickerBox(BuildContext context, Expansion expansion, double height, double width,
      double titleHeight, double dividerHeight, double dividerWidthModifier
     ) {
    return AnimatedContainer(
      duration: AnimatedContainer_Getter.getDuration(),
      height: height, width: width,// color: Colors.blue,
      child: FramedWindow_GUI.getFramedWindow(context, width, height, backgroundOpacity: 0.6, frameType: FrameType.Gold, isDecorated: false,
        function: () => getChapterPickerColumn(context, expansion, height, width, titleHeight, dividerHeight, dividerWidthModifier)
      ),
    );
  }

  static getChapterPickerColumn(BuildContext context, Expansion expansion, double height, double width, double titleHeight, double dividerHeight, double dividerWidthModifier) {
    double dividerWidth = width * dividerWidthModifier;
    double listHeight = height - dividerHeight - titleHeight;
    return Container(
      height: height, width: width,// color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PickerTitle_GUI.getTitle(width, titleHeight, 'Wybierz rozdział'),
          Divider_GUI.getDivider(dividerWidth, dividerHeight),
          getChapterList(context, expansion, listHeight, width)
        ],
      ),
    );
  }

  static getChapterList(BuildContext context, Expansion expansion, double height, double width) {
    LevelSelector_ViewModel levelSelector_ViewModel = context.read<LevelSelector_ViewModel>();
    if(levelSelector_ViewModel.chosenExpansion?.id != expansion.id) return Container();

    double entryHeight = height * 0.25;
    double entryWidth = width * 0.85;
    double dividerHeight = height * 0.1;
    double totalHeight = dividerHeight + entryHeight;

    int itemCount = expansion.chapters.length;
    return Container(
      height: height, width: width,
      child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index){
          Chapter chapter = expansion.chapters[index];
          return GestureDetector(
            onTap: (){
              levelSelector_ViewModel.setChosenChapter(chapter);
            },
            child: Container(
              height: totalHeight, width: entryWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FramedWindow_GUI.getFramedWindow(context, entryWidth, entryHeight, backgroundOpacity: 0.9,
                      function: () => getChapterName(chapter, entryWidth, entryHeight)
                  ),
                  // Divider_GUI.getDivider(width, dividerHeight)
                ],
              ),
            ),
          );
      }),
    );
  }

  static getChapterName(Chapter chapter, double width, double height) {
    double titleWidth = width * 0.7;
    return Container(
      height: height, width: width,// color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Decorator_GUI.getDecorator(height, FrameDecorator.boxLeft)),
          TextAndFont.getText(titleWidth, height, chapter.name, fontSize: height * 0.5),
          Expanded(child: Decorator_GUI.getDecorator(height, FrameDecorator.boxRight)),
        ],
      ),
    );
  }


}