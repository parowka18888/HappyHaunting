import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/03_Level.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/12_Chapter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Divider/Divider_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/GameScrens/LevelPicker/Template/Elements/Title/PickerTitle_GUI.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../Data/Database/Enums/UI/Frame/FrameType.dart';
import '../../GlobalCode/GUI/AnimatedContainer/AnimatedContainer_Getter.dart';
import '../../GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';

class MapPicker_GUI{
  static getMapPickerBox(BuildContext context, double height, double width,
      double titleHeight, double dividerHeight, double dividerWidthModifier, bool isActive
      ) {
    return AnimatedOpacity(
      duration: AnimatedContainer_Getter.getDuration(),
      opacity: isActive ? 1 : 0,
      child: Container(
        height: height, width: width,// color: Colors.blue,
        child: FramedWindow_GUI.getFramedWindow(context, width, height, backgroundOpacity: 0.6, frameType: FrameType.Gold,
            function: () => getMapPickerColumn(context, height, width, titleHeight, dividerHeight, dividerWidthModifier)
        ),
      ),
    );
  }

  static getMapPickerColumn(BuildContext context, double height, double width,
      double titleHeight, double dividerHeight, double dividerWidthModifier
      ) {
    LevelSelector_ViewModel levelSelector_ViewModel = context.read<LevelSelector_ViewModel>();
    Chapter? chapter = levelSelector_ViewModel.chosenChapter;
    if(chapter == null) return Container();
    double dividerWidth = width * dividerWidthModifier;
    double listHeight = height - dividerHeight - titleHeight;
    return Container(
      height: height,width: width, //color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PickerTitle_GUI.getTitle(width, titleHeight, "Wybierz poziom"),
          Divider_GUI.getDivider(dividerWidth, dividerHeight),
          getMapList(context, chapter, width, listHeight)
        ],
      ),
    );
  }

  static getMapList(BuildContext context, Chapter chapter, double width, double height) {
    LevelSelector_ViewModel levelSelector_ViewModel = context.read<LevelSelector_ViewModel>();

    int itemCount = chapter.levels.length;
    double entryHeight = height * 0.25;
    double entryHeight_Active = height * 0.5;
    double entryWidth = width;

    return Container(
      height: height, width: width, //color: Colors.purple,
      child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index){
            Level level = chapter.levels[index];
            bool isLevelChosen = levelSelector_ViewModel.chosenLevel?.id == level.id;
            double finalEntryHeight = isLevelChosen ? entryHeight_Active : entryHeight;
            return GestureDetector(
              onTap: (){
                levelSelector_ViewModel.setChosenLevel(level);
              },
              child: AnimatedContainer(
                duration: AnimatedContainer_Getter.getDuration(),
                curve: AnimatedContainer_Getter.getCurve(),
                width: entryWidth, height: finalEntryHeight,
                child: FramedWindow_GUI.getFramedWindow(context, entryWidth, finalEntryHeight, frameType: FrameType.Gold,
                    function: ()=> getMapDetails(level, entryWidth, finalEntryHeight, isLevelChosen)
                ),
              ),
            );
      }),
    );
  }

  static getMapDetails(Level level, double width, double height, bool isLevelChosen) {
    double coreDataWidth = width * 0.4;
    double coreDataHeight = height * 0.9;
    double padding = height * 0.1;
    return Container(
      height: height, width: width,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          getBackground(height, width, level.background),
          Positioned(
              left: padding,
              child:  getCoreData(coreDataHeight, coreDataWidth, isLevelChosen, level))
        ],
      ),
    );
  }

  static getBackground(double height, double width, String name) {
    return Container(
      height: height, width: width,
      child: Image.asset('assets/images/UI/LevelPicker/$name.png', fit: BoxFit.cover,),
    );
  }

  static getCoreData(double height, double width, bool isLevelChosen, Level level) {
    double titleHeight = isLevelChosen ? height * 0.3 : height * 0.6;
    double dividerHeight = height * 0.15;
    double dividerWidth = width * 0.9;
    double descriptionHeight = height - titleHeight - dividerHeight;
    return AnimatedContainer(
      duration: AnimatedContainer_Getter.getDuration(),
      curve: AnimatedContainer_Getter.getCurve(),
      height: height, width: width, //color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextAndFont.getText(width, titleHeight, level.name),
          if(isLevelChosen)
          Divider_GUI.getDivider(dividerWidth, dividerHeight),
          if(isLevelChosen)
          TextAndFont.getText(width, descriptionHeight, level.startingText),
        ],
      ),
    );
  }
  

}