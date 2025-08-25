import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/01_Power.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/Navigator/AppNavigator.dart';
import 'package:happyhaunting/GameScrens/01_Init/Mechanics/AddingData/AddingData.dart';
import 'package:happyhaunting/GameScrens/01_Init/Mechanics/Checker/InitScreen_Checker.dart';
import 'package:happyhaunting/GameScrens/02_MainMenu/MainMenu.dart';
import 'package:hive/hive.dart';

import '../../Data/Database/DatabaseStructure/00_Ghost.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});
  
  @override
  State<InitScreen> createState() => _InitState();
}

class _InitState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Init"),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    AddingData.loadData();

    Future.delayed(Duration(seconds: 1), (){
      AppNavigator.navigateToScreen(context, MainMenu());
    });


  }

}