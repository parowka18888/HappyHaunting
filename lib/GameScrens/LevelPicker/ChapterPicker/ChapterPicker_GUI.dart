import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/11_Expansion.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/12_Chapter.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Frame/FrameDecorator.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Decorator/Decorator_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/GameScrens/LevelPicker/Template/Elements/PlotTraits_GUI.dart';
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

    LevelSelector_ViewModel levelSelector_ViewModel = context.read<LevelSelector_ViewModel>();
    double coreDataWidth = width * 0.5;
    double coreDataHeight = height * 0.9;
    double coreDataPadding = coreDataWidth * 0.05;

    double traitsSize = height * 0.6;
    double traitTitleHeight = height * 0.15;

    return GestureDetector(
      onTap: (){
        levelSelector_ViewModel.setChosenChapter(chapter);
      },
      child: Container(
        height: height, width: width, color: Colors.blue,
        child: Stack(
          alignment: Alignment(0, 0),
          children: [
            LevelPickerTemplateBackground.getBackground(width, height, chapter.backgroundImage, 'UI/ExpansionPicker/'),
            Positioned(left: coreDataPadding, child: getChapterCoreData(coreDataHeight, coreDataWidth, chapter)),
            Positioned(right: 0, child: PlotTraits_GUI.getPlotTraitsBox(traitsSize, traitTitleHeight, chapter: chapter))
          ],
        ),
      ),
    );
  }

  getChapterCoreData(double height, double width, Chapter chapter) {
    double chapterTitleHeight = height * 0.3;

    double chapterNameTextWidth = width * 0.7;
    double chapterNameHeight = height - chapterTitleHeight;
    
    return Container(
      height: height, width: width,// color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: chapterTitleHeight, width: width, //color: Colors.blue,
            child: TextAndFont.getText(width, chapterTitleHeight, "Rozdział ${chapter.number}"),
          ),
          Container(
            height: chapterNameHeight, width: width,// color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    Expanded(child: Image.asset('assets/images/UI/Decorator/TextDecorator_Left.png'),),
                    TextAndFont.getText(chapterNameTextWidth, chapterNameHeight, chapter.name),
                    Expanded(child: Image.asset('assets/images/UI/Decorator/TextDecorator_Right.png'),),
              ],
            ),
          ),
        ],
      ),
    );
  }


}