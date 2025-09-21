import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/Navigator/AppNavigator.dart';
import 'package:happyhaunting/GameScrens/02_MainMenu/Subclasses/Logo/Logo_GUI.dart';
import 'package:happyhaunting/GameScrens/02_MainMenu/Subclasses/MenuBaner/MenuBanner_GUI.dart';
import 'package:happyhaunting/GameScrens/04_Ghosts/GhostsScreen.dart';
import 'package:happyhaunting/GameScrens/04_LevelPicker/LevelPicker.dart';
import 'package:provider/provider.dart';

import '../00_GlobalCode/GUI/Background/Background.dart';
import '../03_Haunting/Haunting_Screen/HauntingScreen.dart';
import '../ViewModels/Haunting/HauntingGame_ViewModel.dart';
import 'Subclasses/MenuOptions/MenuOptions_GUI.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>
    with TickerProviderStateMixin {

  late AnimationController _controllerAnimationMove_Mode_1;
  late AnimationController _controllerAnimationMove_Mode_2;
  late AnimationController _controllerAnimationMove_Mode_3;
  late Animation<double> _animationMove_Mode_1;
  late Animation<double> _animationMove_Mode_2;
  late Animation<double> _animationMove_Mode_3;

  @override
  void initState() {
    super.initState();

    _controllerAnimationMove_Mode_1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..forward(from: 0.5)..repeat(reverse: true);
    _controllerAnimationMove_Mode_2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..forward(from: 0.25)..repeat(reverse: true);
    _controllerAnimationMove_Mode_3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..forward(from: 0.0)..repeat(reverse: true);

  }

  @override
  void dispose() {
    _controllerAnimationMove_Mode_1.dispose();
    _controllerAnimationMove_Mode_2.dispose();
    _controllerAnimationMove_Mode_3.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    //VALUE FOR LOGO
    double logoWidth = screenHeight * 0.3;
    double logoHeight = logoWidth;
    double logoPadding = logoWidth * 0.1;

    //VALUES FOR MENU OPTIONS
    double menuOptionsWindowHeight = screenHeight * 0.8;
    double menuOptionsWindowWidth = screenWidth;
    double boxHeight = menuOptionsWindowHeight * 0.8;
    double boxWidth = menuOptionsWindowWidth * 0.18;
    double boxPadding = boxWidth * 0.2;
    double animDistance = ((menuOptionsWindowHeight - boxHeight) * 0.5) / 2;
    _animationMove_Mode_1 = Tween<double>(begin: -animDistance, end: animDistance)
        .animate(CurvedAnimation(parent: _controllerAnimationMove_Mode_1, curve: Curves.easeInOut));
    _animationMove_Mode_2 = Tween<double>(begin: -animDistance, end: animDistance)
        .animate(CurvedAnimation(parent: _controllerAnimationMove_Mode_2, curve: Curves.easeInOut));
    _animationMove_Mode_3 = Tween<double>(begin: -animDistance, end: animDistance)
        .animate(CurvedAnimation(parent: _controllerAnimationMove_Mode_3, curve: Curves.easeInOut));

    //VALUES FOR BANNER
    double menuBannerHeight = screenHeight - menuOptionsWindowHeight;
    double menuBannerBoxHeight = menuBannerHeight * 0.9;
    double menuBannerWidth = boxWidth * 3 + boxPadding * 2;


    return Scaffold(
      body: Center(
        child: Container(
          height: screenHeight, width: screenWidth,
          child: Stack(
            alignment: Alignment(0, 0),
            children: [
              //BACKGROUND
              Background.getBackgroundLayers(screenWidth, screenHeight),

              //WINDOW OPTIONS
              Positioned(
                  top: 0,
                  child: MenuOptions_GUI.getMenuOptions(context, menuOptionsWindowWidth, menuOptionsWindowHeight, boxHeight, boxWidth, boxPadding, [_animationMove_Mode_1, _animationMove_Mode_2, _animationMove_Mode_3])
              ),
              //BANNER
              Positioned(
                  bottom: 0,
                  child: MenuBanner_GUI.getMenuBanner(context, menuBannerWidth, menuBannerHeight, menuBannerBoxHeight)
              ),

              //APP LOGO
              // Positioned(
              //   top: logoPadding, left: logoPadding,
              //     child: Logo_GUI.getLogo(context, logoHeight, logoWidth)
              // )
            ],
          ),

        ),
      ),
    );
  }


}