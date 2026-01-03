import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/Data/Database/Enums/Window/GhostSelector/GhostSelector_WindowMode.dart';
import 'package:happyhaunting/Data/Database/Setters/Player/DatabasePlayer_Setter.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/TeamPicker/TeamPicker_Buttons_GUI.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/TeamPicker/TeamPicker_TeamList_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/AnimatedContainer/AnimatedContainer_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/SpecialButtons/CancelButton/CancelButton_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/SpecialButtons/CancelButton/Mechanics/CancelButton_Mechanics.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Cheats/Cheats_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/DedicatedArea/DedicatedArea_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Resources/ResourceBar_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Navigator/AppNavigator.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/Ghosts/GhostList.dart';
import 'package:happyhaunting/GameScrens/LevelPicker/LevelPicker.dart';
import 'package:happyhaunting/ViewModels/Selector/Ghost/GhostSelector_ViewModel.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../GlobalCode/GUI/Background/Background.dart';
import 'GUI/ChosenGhost/GhostView_GUI.dart';
import '../Haunting/Haunting_Screen/HauntingScreen.dart';
import '../../ViewModels/Haunting/HauntingGame_ViewModel.dart';
import 'GUI/ManagePanel/GhostsScreen_SidePanel.dart';

class GhostsScreen extends StatefulWidget {
  const GhostsScreen({super.key});

  @override
  State<GhostsScreen> createState() => _GhostsScreenState();
}

class _GhostsScreenState extends State<GhostsScreen> {
  @override
  Widget build(BuildContext context) {

    final viewModel = context.watch<HauntingGame_ViewModel>();
    final ghostSelector = context.watch<GhostSelector_ViewModel>();
    final level_ViewModel = context.watch<LevelSelector_ViewModel>();

    //GHOSTS IN DATABASE
    Box box_Ghosts = Hive.box<Ghost>('ghosts');

    //SCREEN SIZE
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    //BACKGROUND GHOST BOX
    double ghostViewHeight = screenHeight;
    double ghostViewWidth = screenWidth;

    //LEFT BOX - GHOSTS LIST
    // double sideAreaHeight = level_ViewModel.chosenLevel == null ? screenHeight : screenHeight * 0.95;
    double sideAreaHeight = screenHeight;
    double sideAreaWidth = screenWidth * 0.4;
    double ghostListHeight = sideAreaHeight * 0.7;
    double ghostListWidth = sideAreaWidth * 0.7;
    double sidePanelButtonsHeight = ghostListHeight * 0.175;
    double? ghostListPadding = level_ViewModel.chosenLevel != null ? ghostListHeight * 0.05 : null;

    //TEAM SELECTOR
    double teamList_Height = (sideAreaHeight - ghostListHeight) * 0.4;
    double buttons_Height = teamList_Height * 2;
    double buttons_Width = buttons_Height * 3;
    double teamList_Width = screenWidth;
    double teamList_Padding = teamList_Height * 0.05;
    double buttons_Padding = teamList_Padding * 2 + teamList_Height;



    return Scaffold(
      body: Center(
        child: Container(
          height: screenHeight, width: screenWidth,
            child: Stack(
              alignment: Alignment(0, 0),
              children: [
                //BACKGROUND
                Background.getBackgroundLayers(screenWidth, screenHeight),

                //GHOST VIEW
                GhostView_GUI.getGhostViewLayer(context, ghostViewWidth, ghostViewHeight),

                //GHOSTS LIST
                Positioned(
                  left: 0, top: 0,
                    child: DedicatedArea_GUI.getDedicatedArea(context, sideAreaWidth, sideAreaHeight,
                            () => GhostList.getListLayers(context, ghostListWidth, ghostListHeight, sidePanelButtonsHeight),
                            paddingTop : ghostListPadding
                    )
                ),

                //GHOST MANAGING
                Positioned(
                    right: 0,
                    child: DedicatedArea_GUI.getDedicatedArea(context, sideAreaWidth, sideAreaHeight,
                            () => GhostsScreen_SidePanel.getSidePanelBox(context, ghostListWidth, ghostListHeight, sidePanelButtonsHeight),
                          paddingTop : ghostListPadding
                    )
                ),

                //RESOURCES
                if(level_ViewModel.chosenLevel == null)
                ResourceBar_GUI.getResourceBar(context, screenWidth, screenHeight, isActive: ghostSelector.windowMode == GhostSelector_WindowMode.upgrade),

                //TEAM PICKER
                if(level_ViewModel.chosenLevel != null)
                  Positioned(
                    bottom: teamList_Padding,
                      child: TeamPicker_TeamList_GUI.getTeamListBox(context, teamList_Width, teamList_Height, buttons_Height),
                      // child: TeamPicker_GUI.getTeamPickerContainer(context, teamSelector_Height, teamSelector_Width)
                  ),
                if(level_ViewModel.chosenLevel != null)
                  Positioned(
                    bottom: buttons_Padding,
                    child: TeamPicker_Buttons_GUI.getTeamPickerButtons(context, buttons_Height, buttons_Width)
                    // child: TeamPicker_GUI.getTeamPickerContainer(context, teamSelector_Height, teamSelector_Width)
                  ),


                CancelButton_GUI.getCancelButton(screenHeight,
                  function: () => {
                  level_ViewModel.popScreen(context)
                  }
                ),
                CancelButton_GUI.getCheatButton(screenHeight,
                    function: () => {
                      viewModel.toggleIsCheatWindowVisible()
                    }
                ),

                if(viewModel.isCheatBoxVisible)
                Cheats_GUI.getCheatsBox(context),

              ],
            ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

}