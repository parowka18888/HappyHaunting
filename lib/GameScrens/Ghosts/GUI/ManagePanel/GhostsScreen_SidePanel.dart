import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Window/GhostSelector/GhostSelector_WindowMode.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/DedicatedArea/DedicatedArea_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Divider/Divider_GUI.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/Powers/Description/PowerDescription.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Buttons/Managing_Buttons.dart';
import 'package:happyhaunting/ViewModels/Selector/GhostSelector_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import '../Powers/List/PowerList.dart';
import 'Powers/Managing_Powers.dart';

class GhostsScreen_SidePanel{
  static Widget getSidePanelBox(BuildContext context, double width, double height) {

    double buttonsHeight = height * 0.175;
    double buttonsOffset = - (height / 2);

    return Stack(
      alignment: Alignment(0, 0),
      children: [
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

    return Container(
      width: width, height: height,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          if(currentMode == GhostSelector_WindowMode.powers)
            Managing_Powers.getPowersBox(context, availableWidth, availableHeight)
        ],
      )
    );
  }

}