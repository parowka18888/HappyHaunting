import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/Navigator/AppNavigator.dart';
import 'package:happyhaunting/GameScrens/04_Ghosts/GhostsScreen.dart';
import 'package:happyhaunting/GameScrens/04_LevelPicker/LevelPicker.dart';
import 'package:provider/provider.dart';

import '../03_Haunting/Haunting_Screen/HauntingScreen.dart';
import '../03_Haunting/ViewModel/HauntingGame_ViewModel.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){AppNavigator.navigateToScreen(context, LevelPicker());}, child: Text("Graj")),
              ElevatedButton(onPressed: (){AppNavigator.navigateToScreen(context, GhostsScreen());}, child: Text("Duchy")),
            ],
          )
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

}