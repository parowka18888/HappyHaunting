import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Getter/Statistic_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Statistic.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Divider/Divider_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Powers/Description/Elements/Damage/Power_Damage.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Powers/Description/Elements/Description/Power_Description.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Powers/Description/Elements/CoreData/Power_CoreData.dart';
import 'package:happyhaunting/GameScrens/Ghosts/GUI/ManagePanel/Powers/List/PowerList.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';
import 'package:happyhaunting/ViewModels/Selector/GhostSelector_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../../../../Data/Database/DatabaseStructure/01_Power.dart';

class PowerDescription{
  static Widget getPowerDescriptionBox(BuildContext context, double width, double height, double statsWidth) {

    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    Ghost? ghost = ghostSelector_ViewModel.chosenGhost;
    Power? power = ghostSelector_ViewModel.chosenPower;
    if(power == null || ghost == null){
      return Container();
    }
    double padding = height * 0.025;
    double coreDataHeight = height * 0.5;
    double dividerHeight = height * 0.1;
    double dividerWidth = width * 0.8;
    double descriptionHeight = height - coreDataHeight - padding - dividerHeight;
    return Container(
      width: statsWidth, height: height,// color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Power_CoreData.getCoreDataBox(context, statsWidth, coreDataHeight, power, ghost),
          Divider_GUI.getDivider(dividerWidth, dividerHeight),
          //DESCRIPTION
          Power_Description.getDescriptionBox(context, width, descriptionHeight, power),
          Padding(padding: EdgeInsets.only(top: padding)),
        ],
      ),
    );
  }

}