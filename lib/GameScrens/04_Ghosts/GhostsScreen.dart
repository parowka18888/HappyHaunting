import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/Navigator/AppNavigator.dart';
import 'package:happyhaunting/GameScrens/04_LevelPicker/LevelPicker.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../03_Haunting/Haunting_Screen/HauntingScreen.dart';
import '../03_Haunting/ViewModel/HauntingGame_ViewModel.dart';

class GhostsScreen extends StatefulWidget {
  const GhostsScreen({super.key});

  @override
  State<GhostsScreen> createState() => _GhostsScreenState();
}

class _GhostsScreenState extends State<GhostsScreen> {
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final viewModel = context.watch<HauntingGame_ViewModel>();
    Box box_Ghosts = Hive.box<Ghost>('ghosts');

    return Scaffold(
      body: Center(
        child: Container(
            child: Container(
              width: screenWidth, height: screenHeight,
              color: Colors.blue,
              child: ListView.builder(
                itemCount: box_Ghosts.length,
                  itemBuilder: (context, index){
                  Ghost ghost = box_Ghosts.getAt(index);
                    return Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/Ghosts/${ghost.icon}.png'),
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(ghost.id),
                          Text(ghost.name),
                        ],),
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if(ghost.auras.length > 0)
                            Text(ghost.auras[0].id + " " + ghost.auras[0].name),
                            if(ghost.auras.length > 1)
                              Text(ghost.auras[1].id + " " + ghost.auras[1].name),
                            if(ghost.auras.length > 2)
                              Text(ghost.auras[2].id + " " + ghost.auras[2].name)
                          ],)
                      ],
                    ));
              }),
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