import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/11_Expansion.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Frame/FrameType.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseChapter_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/AnimatedContainer/AnimatedContainer_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/DedicatedArea/DedicatedArea_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/GameScrens/LevelPicker/MapPicker/MapPicker_GUI.dart';
import 'package:happyhaunting/GameScrens/LevelPicker/Template/Elements/PlotTraits_GUI.dart';
import 'package:happyhaunting/GameScrens/LevelPicker/Template/LevelPickerTemplateBackground.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class ExpansionPicker_GUI{
  static getExpansionPickerBox(BuildContext context, double width, double height) {

    var box_Expansion = Hive.box<Expansion>('expansions');
    LevelSelector_ViewModel levelSelector_ViewModel = context.read<LevelSelector_ViewModel>();

    double entyWidth = width;
    double entryHeight = height * 0.4;
    double entryHeight_Activated = height * 1;
    double entryPadding = entryHeight * 0.03;

    int itemCount = box_Expansion.length;

    return Container(
      height: height, width: width, //color: Colors.green,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
            ListView.builder(
              itemCount: itemCount,
              itemBuilder: (context, index){
              Expansion? expansion = box_Expansion.getAt(index);
              if(expansion == null) return Container();
              bool isThisExpansionChosen = levelSelector_ViewModel.chosenExpansion?.id == expansion.id;
              double newHeight = isThisExpansionChosen ? entryHeight_Activated : entryHeight;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: AnimatedContainer_Getter.getDuration(),
                    curve: AnimatedContainer_Getter.getCurve(),
                    height: newHeight, width: entyWidth,
                    child: FramedWindow_GUI.getFramedWindow(context, entyWidth, newHeight,
                        frameType: FrameType.Gold,
                        function: () => getExpansionBox(context, entyWidth, newHeight, expansion, entryHeight),
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

  static getExpansionBox(BuildContext context, double width, double height, Expansion expansion, double defaultHeight) {

    LevelSelector_ViewModel levelSelector_ViewModel = context.read<LevelSelector_ViewModel>();
    bool isExpansionChosen = levelSelector_ViewModel.chosenExpansion?.id == expansion.id;

    double padding = defaultHeight * 0.1;
    //LEFT SIDE
    double descriptionHeight = defaultHeight * 0.6;
    double chapterPickerHeight = height - descriptionHeight - padding * 2;
    double leftSideWidth = width * 0.325;
    double topPadding_ChapterPicker = isExpansionChosen ? padding : padding - chapterPickerHeight * 2;

    //LEVEL PICKER
    double paddingLevelPicker_Top = height * 0.25;
    double paddingLevelPicker_Bottom = height * 0.1;
    double levelPickerHeight = height - paddingLevelPicker_Bottom - paddingLevelPicker_Top;
    double levelPickerWidth = width * 0.87;

    //TITLE AND DIVIDER
    double titleHeight = height * 0.125;
    double dividerHeight = height * 0.05;
    double dividerWidthModifier = 0.8;


    double circleSize = defaultHeight * 0.6;
    double circleTitle = defaultHeight * 0.15;
    double circleBoxPadding = width * 0.025;

    return Container(
      height: height, width: width,
      child: GestureDetector(
        onTap: (){
          if(levelSelector_ViewModel.chosenExpansion?.id == expansion.id){
            levelSelector_ViewModel.clear();
          } else {
            levelSelector_ViewModel.clear();
            levelSelector_ViewModel.setChosenExpansion(expansion);
          }
        },
        child: Stack(
          alignment: Alignment(0, 0),
          children: [
            LevelPickerTemplateBackground.getBackground(width, height, expansion.backgroundImage, 'UI/ExpansionPicker/'),
            //DESCRIPTION
            Positioned(
              bottom: padding, left: padding,
              child: AnimatedOpacity
                (
                opacity: levelSelector_ViewModel.chosenExpansion?.id == expansion.id ? 0 : 1,
                duration: AnimatedContainer_Getter.getDuration(),
                curve: AnimatedContainer_Getter.getCurve(),
                child: TextAndFont.getText(leftSideWidth, descriptionHeight,
                    expansion.description,
                    // fontSize: descriptionHeight * 0.25,
                    alignment: Alignment.bottomLeft
                ),
              )
            ),

            //STATS
              Positioned(
                  right: circleBoxPadding,
                  child: AnimatedOpacity
                    (
                    opacity: levelSelector_ViewModel.chosenExpansion?.id == expansion.id ? 0 : 1,
                    duration: AnimatedContainer_Getter.getDuration(),
                    curve: AnimatedContainer_Getter.getCurve(),
                      child: PlotTraits_GUI.getPlotTraitsBox(circleSize, circleTitle, expansion: expansion)
                  )
              ),

            //LEVEL PICKER
            if(levelSelector_ViewModel.chosenExpansion?.id == expansion.id)
            AnimatedPositioned(
                duration: AnimatedContainer_Getter.getDuration(),
                top: paddingLevelPicker_Top,
                bottom: paddingLevelPicker_Bottom,
                child: MapPicker_GUI.getMapPickerBox(context,
                    levelPickerHeight, levelPickerWidth,
                    titleHeight, dividerHeight, dividerWidthModifier,
                    isExpansionChosen
                )
            ),

          ],
    ),
      ),
    );

  }

}