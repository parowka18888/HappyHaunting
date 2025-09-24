import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/DedicatedArea/DedicatedArea_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Navigator/AppNavigator.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/Ghosts/GhostList.dart';
import 'package:happyhaunting/GameScrens/LevelPicker/LevelPicker.dart';
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

    //GHOSTS IN DATABASE
    Box box_Ghosts = Hive.box<Ghost>('ghosts');

    //SCREEN SIZE
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    //BACKGROUND GHOST BOX
    double ghostViewHeight = screenHeight;
    double ghostViewWidth = screenWidth;

    //LEFT BOX - GHOSTS LIST
    double sideAreaHeight = screenHeight;
    double sideAreaWidth = screenWidth * 0.4;
    double ghostListHeight = sideAreaHeight * 0.7;
    double ghostListWidth = sideAreaWidth * 0.7;

    final viewModel = context.watch<HauntingGame_ViewModel>();

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
                  left: 0,
                    child: DedicatedArea_GUI.getDedicatedArea(context, sideAreaWidth, sideAreaHeight,
                            () => GhostList.getListLayers(context, ghostListWidth, ghostListHeight)
                    )
                ),

                //GHOST MANAGING
                Positioned(
                    right: 0,
                    child: DedicatedArea_GUI.getDedicatedArea(context, sideAreaWidth, sideAreaHeight,
                            () => GhostsScreen_SidePanel.getSidePanelBox(context, ghostListWidth, ghostListHeight)
                    )
                )
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