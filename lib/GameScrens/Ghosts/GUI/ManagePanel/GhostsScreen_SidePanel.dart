import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Window/GhostSelector/GhostSelector_WindowMode.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Template/SidePanelTemplate.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Background/BackgroundPattern.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/DedicatedArea/DedicatedArea_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Divider/Divider_GUI.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Powers/Description/PowerDescription.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Buttons/Managing_Buttons.dart';
import 'package:happyhaunting/ViewModels/Selector/GhostSelector_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';

class GhostsScreen_SidePanel{
  static Widget getSidePanelBox(BuildContext context, double width, double height) {

    double buttonsHeight = height * 0.175;
    double buttonsOffset = - (height / 2) ;

    return Stack(
      alignment: Alignment(0, 0),
      children: [
        BackgroundPattern.getBackgroundPatter(width),
        FramedWindow_GUI.getFramedWindow(
            context, width, height, backgroundOpacity: 0.8,
            function: () => getGhostData(context, height, width,)
        ),
        Transform.translate(
          offset: Offset(0, buttonsOffset),
          child: Managing_Buttons.getManagingButtons(context, width, buttonsHeight),
        ),
      ],
    );
  }

  static getGhostData(BuildContext context, double height, double width) {

    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    GhostSelector_WindowMode currentMode = ghostSelector_ViewModel.windowMode;

    double availableWidth = width * 0.85;
    double availableHeight = height - (width - availableWidth);

    double segment1Height = availableHeight * 0.25;
    double segment3Height = availableHeight * 0.25;
    double dividerHeight = availableHeight * 0.07;
    double segment2Height = availableHeight - segment1Height - segment3Height - dividerHeight * 2;
    double dynamicHeightChangeValue = segment3Height * 0.5;

    if(ghostSelector_ViewModel.chosenGhost == null){
      return Container();
    }

    return Container(
      width: width, height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SidePanelTemplate.getFirstSegment(context, availableWidth, segment1Height),
          Divider_GUI.getDivider(width, dividerHeight),
          SidePanelTemplate.getSecondSegment(context, width,
              ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.powers || ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.upgrade ? segment2Height + dynamicHeightChangeValue : segment2Height,
              availableWidth
          ),
          Divider_GUI.getDivider(width, dividerHeight),
          SidePanelTemplate.getThirdSegment(context, availableWidth,
              ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.powers || ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.upgrade ? segment3Height - dynamicHeightChangeValue : segment3Height),
        ],
      )
    );
  }

}