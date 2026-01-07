import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/ViewModels/Haunting/HauntingGame_ViewModel.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../../Data/Database/Setters/Player/DatabasePlayer_Setter.dart';

class Cheats_GUI{

  static Box box_Ghosts = Hive.box<Ghost>('ghosts');

  static getCheatsBox(BuildContext context) {

    HauntingGame_ViewModel hauntingGame_ViewModel = context.watch<HauntingGame_ViewModel>();

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            DatabasePlayer_Setter.cheatResources(multiplier: 5);
            hauntingGame_ViewModel.refresh();
          }, child: Text('DODAJ ZASOBY!')),
          ElevatedButton(onPressed: (){
            for(int i = 0; i < box_Ghosts.length; i++){
              Ghost ghost = box_Ghosts.getAt(i);
              ghost.isUnlocked = true;
              ghost.save();
            }
          }, child: Text('ODBLOKUJ DUCHY'))
        ],
      ),
    );
  }

}