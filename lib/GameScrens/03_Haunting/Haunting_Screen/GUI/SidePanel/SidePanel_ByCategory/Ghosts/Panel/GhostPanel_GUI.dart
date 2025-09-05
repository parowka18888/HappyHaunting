import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/Aura/Haunting_Aura.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';

import '../../../../../../../../Data/Database/DatabaseStructure/04_Aura.dart';
import '../../../../../../Haunting_Game/Classes/Power/Haunting_Power.dart';
import '../../../../../../Haunting_Game/Classes/Power/Setter/PowerSetter.dart';


class GhostPanel_GUI{
  static getGhostPanel(BuildContext context, double width, double height, HauntingGame_ViewModel viewModel, Haunting_Ghost ghost) {

    double powersHeight = height * 0.3;
    double powersWidth = width * 0.8;

    return Container(
      height: height, width: width, color: viewModel.chosenGhost != null && viewModel.chosenGhost!.name == ghost.name ? Colors.green : Colors.red,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          //BACKGROUND
          //GHOST IMAGE
          Positioned(top: 0, left: 0, child: getGhostImage(width, height, ghost, viewModel)),
          //POWERS
          if(ghost.isPlaced == true)
          Positioned(bottom: 0, right: 0, child: getGhostPowers(powersWidth, powersHeight, ghost, context, viewModel)),
          //AURAS
          if(ghost.isDefeated == false)
          Positioned(top: 0, right: 0, child: getGhostAuras(powersWidth, powersHeight, ghost, context, viewModel)),
          //HEALTH BAR
          Positioned(bottom: 30,
              child: getGhostHealth(context, ghost)
          )
        ],
      ),
    );
  }

  static getGhostImage(double width, double height, Haunting_Ghost ghost, HauntingGame_ViewModel viewModel) {
    return GestureDetector(
      onTap: (){
        if(ghost.isFree && ghost.isDefeated == false){
          if(viewModel.chosenGhost != null){
            if(viewModel.chosenGhost!.name == ghost.name){
              viewModel.setChosenGhost(null);
            } else {
              viewModel.setChosenGhost(ghost);
            }
          } else {
            viewModel.setChosenGhost(ghost);
          }
        }

      },
      child: Container(
        height: height,
        child: Opacity(opacity: ghost.isPlaced == true ? 1.0 : 0.5,
          child: Image.asset('assets/images/Ghosts/${ghost.icon}.png', fit: BoxFit.fitHeight,),
        )
      ),
    );
  }

  static getGhostPowers(double width, double height, Haunting_Ghost ghost, BuildContext context, HauntingGame_ViewModel viewModel) {
   return Container(
      height: height, width: width, color: Colors.green,
      child: ListView.builder(
          itemCount: ghost.powers.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            Haunting_Power power = ghost.powers[index];
            return GestureDetector(
              onTap: (){
                if(power.isDeactivatingForbidden == false){
                  PowerSetter.togglePowerActivation(power, game: viewModel.game);
                  viewModel.refresh();
                }
              },
              child: Opacity(opacity: power.isActivated == true ? 1.0 : 0.5,
                child: Image.asset('assets/images/Powers/${power.icon}.png',),
              )
            );
      }),
    );
  }

  static getGhostAuras(double width, double height, Haunting_Ghost ghost, BuildContext context, HauntingGame_ViewModel viewModel) {
    return Container(
      height: height, width: width,// color: Colors.green,
      child: ListView.builder(
          itemCount: ghost.auras.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            Aura aura = ghost.auras[index];
            return Image.asset('assets/images/Auras/${aura.icon}.png',);
          }),
    );
  }

  static getGhostHealth(BuildContext context, Haunting_Ghost ghost) {
    return Text("${ghost.health_Current} / ${ghost.health_Maximum}");
  }

}