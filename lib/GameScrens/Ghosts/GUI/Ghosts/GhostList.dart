import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Button/ButtonType.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Background/BackgroundPattern.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/Ghosts/FilterButtons/GhostFilterButtons.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Buttons/Managing_Buttons.dart';
import 'package:happyhaunting/ViewModels/Selector/GhostSelector_ViewModel.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../../Data/Database/DatabaseStructure/00_Ghost.dart';

class GhostList{
  static getListLayers(BuildContext context, double width, double height) {

    double buttonsHeight = height * 0.15;
    double buttonsOffset = - (height / 2);

    return Container(
      height: height, width: width,// color: Colors.pink,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          BackgroundPattern.getBackgroundPatter(width),
          FramedWindow_GUI.getFramedWindow(
              context, width, height, backgroundOpacity: 0.8,
            function: () => getList(context, height, width,)
          ),
          Transform.translate(offset: Offset(0, buttonsOffset),
            child: GhostFilterButtons.getFilterButtons(context, width, buttonsHeight),
          )
        ],
      ),
    );
  }

  static getList(BuildContext context, double height, double width) {

    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();

    double framePadding = width * 0.1;

    double listHeight = height - 2 * framePadding;
    double listWidth = width - 2 * framePadding;

    int itemsInLine = 4;
    double itemPadding = framePadding * 0.2;
      double areaForItems = listWidth - (itemPadding * itemsInLine - 1);

    double itemSize = areaForItems / itemsInLine;

    Box box_Ghosts = Hive.box<Ghost>('ghosts');
    int itemsCount = box_Ghosts.length;

    List<Ghost> ghosts = box_Ghosts.values.cast<Ghost>().toList();
    if(ghostSelector_ViewModel.chosenGhostTypes.isNotEmpty){
      ghosts = ghosts.where((ghost) => ghostSelector_ViewModel.chosenGhostTypes.contains(ghost.mainStat)).toList();
    }
    ghosts.sort((a, b) => a.isUnlocked ? -1 : 1);

    ghosts.sort((a, b) {
      if (a.isUnlocked != b.isUnlocked) {
        return a.isUnlocked ? -1 : 1;
      }
      return a.name.compareTo(b.name);
    });

    return Container(
      height: height, width: width,// color: Colors.green,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Container(
            height: listHeight, width: listWidth, //color: Colors.amber,
            child: AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                child:  GridView.count(
                  crossAxisCount: itemsInLine,
                  crossAxisSpacing: itemPadding,
                  mainAxisSpacing: itemPadding,
                  key: ValueKey(ghosts.length),
                  children: List.generate(ghosts.length, (index) {
                    Ghost ghost = ghosts[index];
                    return Container(
                      height: itemSize, width: itemSize,
                      child: Button_GUI.getButton(
                          itemSize, ghost.icon, catalog: 'Ghosts', buttonType: ButtonType.Square,
                          function: () => ghostSelector_ViewModel.setChosenGhost(ghost)
                      ),
                    );
                  }),
                )
            ),
            // child: GridView.count(
            //     crossAxisCount: itemsInLine,
            //     crossAxisSpacing: itemPadding,
            //     mainAxisSpacing: itemPadding,
            //     children: List.generate(ghosts.length, (index) {
            //       Ghost ghost = ghosts[index];
            //       return Container(
            //         height: itemSize, width: itemSize,
            //         child: Button_GUI.getButton(
            //             itemSize, ghost.icon, catalog: 'Ghosts', buttonType: ButtonType.Square,
            //             function: () => ghostSelector_ViewModel.setChosenGhost(ghost)
            //         ),
            //       );
            //     }),
            // )
          )
        ],
      ),
    );
  }

}