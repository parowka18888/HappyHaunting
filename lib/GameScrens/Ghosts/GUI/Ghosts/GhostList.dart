import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Button/ButtonType.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/AnimatedContainer/AnimatedContainer_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Background/BackgroundPattern.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/Ghosts/FilterButtons/GhostFilterButtons.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Buttons/Managing_Buttons.dart';
import 'package:happyhaunting/ViewModels/Selector/Ghost/GhostSelector_ViewModel.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_CheckConditions.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:diacritic/diacritic.dart';


import '../../../../Data/Database/DatabaseStructure/00_Ghost.dart';

class GhostList{
  static getListLayers(BuildContext context, double width, double height, double sidePanelButtonsHeight) {

    GhostSelector_ViewModel viewModel = context.watch<GhostSelector_ViewModel>();

    double buttonHeightPaddingModifier = 0.7;
    double totalHeight = height + sidePanelButtonsHeight * buttonHeightPaddingModifier;
    double filterPadding = viewModel.isFilterButtonsBoxVisible ? 0 : -sidePanelButtonsHeight;
    return Container(
      height: totalHeight, width: width,// color: Colors.blue,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          BackgroundPattern.getBackgroundPatter(width),
          Positioned(bottom: 0, child: FramedWindow_GUI.getFramedWindow(
              context, width, height, backgroundOpacity: 0.8,
              function: () => getList(context, height, width,)
          )),
          Positioned(top: 0, child: GhostFilterButtons.getFilterMainButton(viewModel, width, sidePanelButtonsHeight)),
          AnimatedPositioned(
              duration: AnimatedContainer_Getter.getDuration(),
              curve: AnimatedContainer_Getter.getCurve(),
              bottom: filterPadding,
              child: FramedWindow_GUI.getFramedWindow(context, width, sidePanelButtonsHeight,
              function: ()=> GhostFilterButtons.getFilterButtons(context, width, sidePanelButtonsHeight))
              )
          // Positioned(top: 0, child: GhostFilterButtons.getFilterButtons(context, width, sidePanelButtonsHeight))
        ],
      ),
    );
  }

  static getList(BuildContext context, double height, double width) {

    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    LevelSelector_ViewModel levelSelector_ViewModel = context.watch<LevelSelector_ViewModel>();

    double framePadding = width * 0.1;

    double listHeight = height - 2 * framePadding;
    double listWidth = width - 2 * framePadding;

    int itemsInLine = 4;
    double itemPadding = framePadding * 0.2;
      double areaForItems = listWidth - (itemPadding * itemsInLine - 1);

    double itemSize = areaForItems / itemsInLine;
    double ghostTierSize = itemSize * 0.3;

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
      final nameA = removeDiacritics(tr(a.name)).toLowerCase();
      final nameB = removeDiacritics(tr(b.name)).toLowerCase();
      return nameA.compareTo(nameB);
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
                    return Stack(
                      alignment: Alignment(0, 0),
                      children: [
                        Container(
                          height: itemSize, width: itemSize,
                          child: Button_GUI.getButton(
                              itemSize, ghost.icon, catalog: 'Ghosts', buttonType: ButtonType.Square,
                              imageSize: 1.0,
                              function: () => ghostSelector_ViewModel.setChosenGhost(ghost),
                              isActive: ghost.isUnlocked,
                              isImageHiddenWithDarkLayer: !ghost.isUnlocked,
                              opacity: ghost.isUnlocked ? LevelSelector_CheckConditions.checkIfGhostIsInTeam(ghost, levelSelector_ViewModel) ? 1.0 : 0.3 : 0.3
                          ),
                        ),
                        if(ghost.isUnlocked)
                        Positioned(
                            bottom: 0, left: 0,
                            child: Button_GUI.getTierButton(ghost, ghostTierSize))

                      ],
                    );
                  }),
                )
            ),
          )
        ],
      ),
    );
  }

}