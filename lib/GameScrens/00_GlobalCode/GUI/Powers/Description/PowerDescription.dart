import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Getter/Statistic_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Statistic.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Powers/Description/Elements/Damage/Power_Damage.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Powers/Description/Elements/Description/Power_Description.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Powers/Description/Elements/CoreData/Power_CoreData.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Powers/List/PowerList.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/GameScrens/ViewModels/GhostSelector/GhostSelector_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../../../Data/Database/DatabaseStructure/01_Power.dart';

class PowerDescription{
  static Widget getPowerDescriptionBox(BuildContext context, double width, double height) {

    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    Ghost? ghost = ghostSelector_ViewModel.chosenGhost;
    Power? power = ghostSelector_ViewModel.chosenPower;
    if(power == null || ghost == null){
      return Container();
    }
    double padding = height * 0.025;
    double coreDataHeight = height * 0.39;
    double descriptionHeight = height * 0.39- padding;
    double damageHeight = height - coreDataHeight - descriptionHeight - padding * 2;
    return Container(
      width: width, height: height,// color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // IMAGE / NAME, COST, COOLDOWN
          Power_CoreData.getCoreDataBox(context, width, coreDataHeight, power, ghost),
          Padding(padding: EdgeInsets.only(top: padding)),
          //DESCRIPTION
          Power_Description.getDescriptionBox(context, width, descriptionHeight, power),
          Padding(padding: EdgeInsets.only(top: padding)),
          //DAMAGE
          FramedWindow_GUI.getFramedWindow(context, width, damageHeight, function: () => Power_Damage.getDamageBox(context, width, damageHeight, power))

        ],
      ),
    );
  }

}