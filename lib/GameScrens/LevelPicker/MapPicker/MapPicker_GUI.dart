import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/AppData/AppData.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/03_Level.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/12_Chapter.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Frame/FrameDecorator.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseObject_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Background/BackgroundPattern.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Decorator/Decorator_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Divider/Divider_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/GameScrens/LevelPicker/Template/Elements/Title/PickerTitle_GUI.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../Data/Database/Enums/UI/Frame/FrameType.dart';
import '../../../ViewModels/Haunting/HauntingGame_ViewModel.dart';
import '../../GlobalCode/GUI/AnimatedContainer/AnimatedContainer_Getter.dart';
import '../../GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import '../../GlobalCode/Navigator/AppNavigator.dart';
import '../../Haunting/Haunting_Screen/HauntingScreen.dart';

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
    return Container(
      height: height,width: width, //color: Colors.yellow,
      child: getMapList(context, width, height)
    );
  }

  static getMapList(BuildContext context, double width, double height) {
    LevelSelector_ViewModel levelSelector_ViewModel = context.read<LevelSelector_ViewModel>();

    double entryHeight = height * 0.3;
    double entryWidth = width;

    final int itemCount = levelSelector_ViewModel.chosenExpansion!.levels.length;
    return Container(
      height: height, width: width, //color: Colors.purple,
      child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index){
            Level level = levelSelector_ViewModel.chosenExpansion!.levels[index];
            return AnimatedContainer(
              duration: AnimatedContainer_Getter.getDuration(),
              curve: AnimatedContainer_Getter.getCurve(),
              width: entryWidth, height: entryHeight,
              child: FramedWindow_GUI.getFramedWindow(context, entryWidth, entryHeight, frameType: FrameType.Gold,
                  function: ()=> getMapDetails(context, level, entryWidth, entryHeight)
              ),
            );
      }),
    );
  }

  static getMapDetails(BuildContext context, Level level, double width, double height) {
    // double coreDataWidth = width * 0.375;
    // double coreDataHeight = height * 0.7;

    Box box_Levels = Hive.box<Level>('levels');
    final viewModel = context.watch<HauntingGame_ViewModel>();

    //DEFAULT DATA
    double padding = height * 0.1;
    double defaultHeight = height - padding;

    //TRAPPED GHOSTS
    double trappedGhostsHeight = defaultHeight * 0.6;

    //PLAY BUTTON
    double playButtonHeight = defaultHeight * 0.8;
    bool isLevelUnlocked = level.isUnlocked;

    //TITLE
    double titleHeight = defaultHeight;
    double titleWidth = width * 0.375;

    //TIME
    double timePadding = padding * 2 + playButtonHeight;
    double timeHeight = defaultHeight;
    double timeWidth = (width / 2) - timePadding - titleWidth / 2;



    return Container(
      height: height, width: width,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          //BACKGROUND
          Opacity(opacity: 0.15, child: BackgroundPattern.getBackgroundPatter(width),),
          getBackground(height, width, level.background),

          //GHOSTS
          Positioned(
              left: padding, bottom: padding,
              child: getTrappedGhostsContainer(context, trappedGhostsHeight, width, level)),
          //PLAY BUTTON
          Positioned(
            right: padding,
            child: Button_GUI.getButton(playButtonHeight, 'ArrowRight',
              isIconOpacityLowered: !isLevelUnlocked,
              isActive: isLevelUnlocked,
              function: (){
                viewModel.clearData();
                AppNavigator.navigateToScreen(context,
                    HauntingScreen(chosenLevel: DatabaseObject_Getter.getObjectById(level.id, box_Levels))
                );
              }
            ),
          ),
          //TIME
          Positioned(
            // right: timePadding,
            child: getTimeContainer(timeWidth, defaultHeight, level)),

          //CORE DATA (TITLE)
          Positioned(
              child: getCoreData(titleWidth, titleHeight, level)
          ),
        ],
      ),
    );
  }

  static getBackground(double height, double width, String name) {
    return Container(
      height: height, width: width,
      child: Image.asset('assets/images/UI/LevelPicker/$name.png', fit: BoxFit.fitHeight, alignment: Alignment.centerLeft,),
    );
  }

  static getTrappedGhostsContainer(BuildContext context, double height, double width, Level level) {

    double padding = height * 0.05;
    double circleSize = height;

    int itemCount = level.trappedGhosts.length;

    return Container(
      height: height, width: width,
      child: ListView.builder(
          itemCount: itemCount,
          padding: EdgeInsets.only(left: 0, bottom: 0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            Ghost ghost = level.trappedGhosts[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button_GUI.getButton(
                    circleSize, ghost.icon, catalog: 'Ghosts',
                    imageSize: 1, isIconOpacityLowered: !ghost.isUnlocked, isImageHiddenWithDarkLayer: !ghost.isUnlocked
                ),
                Padding(padding: EdgeInsets.only(left: padding))
              ],
            );
          }
      )
    );
  }

  static getTimeContainer(double width, double height, Level level) {
    double timeHeight = height * 0.5;
    double rateHeight = height - timeHeight;
    return Container(
      height: height, width: width, //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              level.rate.clamp(0, 5),
                  (_) => Image.asset('assets/images/UI/Icons/Rate.png'),
            ),
          ),),
          TextAndFont.getText(width, timeHeight, "Najlepszy czas: 12:34:12")
        ],
      ),
    );
  }

  static getCoreData(double width, double height, Level level) {
    double decoratorWidth = width * 0.2;
    double titleWidth = width - decoratorWidth * 2;
    return Container(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: decoratorWidth, height: height,
            child: Decorator_GUI.getDecorator(height, FrameDecorator.boxLeft),
          ),
          Container(width: titleWidth, height: height,
            child: TextAndFont.getText(titleWidth, height, level.name),
          ),
          Container(width: decoratorWidth, height: height,
            child: Decorator_GUI.getDecorator(height, FrameDecorator.boxRight),
          ),
        ],
      ),
    );
  }

  

}