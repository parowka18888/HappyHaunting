import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/11_Expansion.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Frame/FrameType.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseChapter_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/GameScrens/LevelPicker/Template/Elements/PlotTraits_GUI.dart';
import 'package:happyhaunting/GameScrens/LevelPicker/Template/LevelPickerTemplateBackground.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class ExpansionPicker_GUI{
  static getExpansionPickerBox(BuildContext context, double width, double height) {

    var box_Expansion = Hive.box<Expansion>('expansions');

    double entyWidth = width;
    double entryHeight = height * 0.4;
    double entryHeight_Activated = height * 0.5;
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

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: entryHeight, width: entyWidth,
                    child: FramedWindow_GUI.getFramedWindow(context, entyWidth, entryHeight,
                        frameType: FrameType.Gold,
                        function: () => getExpansionBox(context, entyWidth, entryHeight, expansion),
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

  static getExpansionBox(BuildContext context, double width, double height, Expansion expansion) {

    LevelSelector_ViewModel levelSelector_ViewModel = context.read<LevelSelector_ViewModel>();

    double descriptionHeight = height * 0.4;
    double descriptionWidth = width * 0.4;
    double descriptionPadding = height * 0.1;

    double circleSize = height * 0.6;
    double circleTitle = height * 0.15;
    double circleBoxPadding = width * 0.025;

    return Container(
      height: height, width: width,
      child: GestureDetector(
        onTap: (){
          levelSelector_ViewModel.setChosenExpansion(expansion);
        },
        child: Stack(
          alignment: Alignment(0, 0),
      children: [
        LevelPickerTemplateBackground.getBackground(width, height, expansion.backgroundImage, 'UI/ExpansionPicker/'),
        Positioned(
          bottom: descriptionPadding, left: descriptionPadding,
          child: TextAndFont.getText(descriptionWidth, descriptionHeight,
              expansion.description,
              fontSize: descriptionHeight * 0.25,
              alignment: Alignment.bottomLeft
          )
          ,),
        Positioned(
            right: circleBoxPadding,
            child: PlotTraits_GUI.getPlotTraitsBox(circleSize, circleTitle, expansion: expansion)
        )
      ],
    ),
      ),
    );

  }

}