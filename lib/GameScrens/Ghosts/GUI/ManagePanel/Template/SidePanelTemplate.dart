import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Window/GhostSelector/GhostSelector_WindowMode.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/CoreData/Managing_CoreData.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/LevelDetails/LevelDetails_GUI.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Play/Play_GUI.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Powers/Description/PowerDescription.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Powers/Description/Elements/Description/Power_Description.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Powers/List/PowerList.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Upgrade/UpgradePrice_GUI.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Upgrade/UpgradeTiersPreview_GUI.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Upgrade/UpgradeValues_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/AnimatedContainer/AnimatedContainer_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Background/Background.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_CheckConditions.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../../../ViewModels/Selector/Ghost/GhostSelector_ViewModel.dart';
import '../../../../GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import '../Powers/Description/Elements/Damage/Power_Damage.dart';

class SidePanelTemplate{



  static getFirstSegment(BuildContext context, double width, double height) {
    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    LevelSelector_ViewModel levelSelector_CheckConditions = context.watch<LevelSelector_ViewModel>();
    Ghost? ghost = ghostSelector_ViewModel.chosenGhost;
    return Container(
      height: height, width: width, //color: Colors.purple,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.introduction)
            Managing_CoreData.getImagesBox(ghost!, width, height),
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.powers)
            PowerList.getPowerList(ghostSelector_ViewModel, width, height),
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.upgrade)
            UpgradeValues_GUI.getUpgradeValues(ghostSelector_ViewModel, width, height),
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.level)
            LevelDetails_GUI.getLevelName(levelSelector_CheckConditions, width, height),
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.play)
            Play_GUI.getInfoBox(width, height)
        ],
      ),
    );
  }

  static getSecondSegment(BuildContext context, double width, double height, double availableWidth) {
    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    LevelSelector_ViewModel levelSelector_ViewModel = context.watch<LevelSelector_ViewModel>();
    Ghost? ghost = ghostSelector_ViewModel.chosenGhost;
    double decoratorWidth = width * 0.15;
    return AnimatedContainer(
      duration: AnimatedContainer_Getter.getDuration(), curve: AnimatedContainer_Getter.getCurve(),
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Background.getBackgroundShade(width, height),
          Positioned(
              left: 0,
              child: Container(
                width: decoratorWidth,
                child: Image.asset('assets/images/UI/Decorator/TextDecorator_Left.png'),
              )),
          Positioned(
              right: 0,
              child: Container(
                width: decoratorWidth,
                child: Image.asset('assets/images/UI/Decorator/TextDecorator_Right.png'),
              )),
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.introduction)
            Managing_CoreData.getNameAndDescriptionBox(ghost!, availableWidth, height),
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.powers)
            PowerDescription.getPowerDescriptionBox(context, availableWidth, height, width),
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.upgrade)
            UpgradePrice_GUI.getUpgradePriceBox(context, availableWidth, height),
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.level)
            LevelDetails_GUI.getDescription(levelSelector_ViewModel, availableWidth, height),
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.play)
            Play_GUI.getPlayButton(context, availableWidth, height)

        ],
      ),
    );
  }

  static getThirdSegment(BuildContext context, double width, double height) {
    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    LevelSelector_ViewModel levelSelector_ViewModel = context.watch<LevelSelector_ViewModel>();
    Ghost? ghost = ghostSelector_ViewModel.chosenGhost;
    return AnimatedContainer(
      duration: AnimatedContainer_Getter.getDuration(), curve: AnimatedContainer_Getter.getCurve(),
      height: height,
      width: width, //color: Colors.purple,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.introduction)
            Managing_CoreData.getTierBox(ghost!, width, height),
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.powers)
            FramedWindow_GUI.getFramedWindow(context, width, height, function: () => Power_Damage.getDamageBox(context, width, height)),
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.upgrade)
            UpgradeTiersPreview_GUI.getTiersPreview(width, height, ghost!),
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.level)
            LevelDetails_GUI.getTrappedGhostsList(levelSelector_ViewModel, width, height, ),
          if(ghostSelector_ViewModel.windowMode == GhostSelector_WindowMode.play)
            Play_GUI.getSettingsBox(levelSelector_ViewModel, width, height, )

        ],
      ),
    );
  }


}