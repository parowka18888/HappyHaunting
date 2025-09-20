import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/Navigator/AppNavigator.dart';
import 'package:happyhaunting/GameScrens/02_MainMenu/Subclasses/Background/Background.dart';
import 'package:happyhaunting/GameScrens/04_Ghosts/GhostsScreen.dart';
import 'package:happyhaunting/GameScrens/04_LevelPicker/LevelPicker.dart';
import 'package:provider/provider.dart';

import '../03_Haunting/Haunting_Screen/HauntingScreen.dart';
import '../03_Haunting/ViewModel/HauntingGame_ViewModel.dart';
import 'Subclasses/MenuOptions/MenuOptions_GUI.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double menuOptionsWindowHeight = screenHeight * 0.8;
    double menuOptionsWindowWidth = screenWidth;

    return Scaffold(
      body: Center(
        child: Container(
          height: screenHeight, width: screenWidth,
          child: Stack(
            alignment: Alignment(0, 0),
            children: [
              //BACKGROUND
              Background.getBackground(screenWidth, screenHeight),
              Background.getBackgroundShade(screenWidth, screenHeight),

              //WINDOW OPTIONS
              Positioned(
                  top: 0,
                  child: MenuOptions_GUI.getMenuOptions(context, menuOptionsWindowWidth, menuOptionsWindowHeight)
              ),
            ],
          ),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ElevatedButton(onPressed: (){AppNavigator.navigateToScreen(context, LevelPicker());}, child: Text("Graj")),
          //     ElevatedButton(onPressed: (){AppNavigator.navigateToScreen(context, GhostsScreen());}, child: Text("Duchy")),
          //   ],
          // )
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

}