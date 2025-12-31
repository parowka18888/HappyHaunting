import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Mortal_DefeatType.dart';
import 'package:happyhaunting/Data/Database/Enums/Window/Haunting/GameWindow.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Buttons/Button_GUI.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/SubClasses/Aura/Haunting_Aura.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/ViewModels/Haunting/HauntingGame_ViewModel.dart';

import '../../../../../../../../Data/Database/DatabaseStructure/04_Aura.dart';
import '../../../../../../Haunting_Game/Classes/Power/Haunting_Power.dart';
import '../../../../../../Haunting_Game/Classes/Power/Setter/PowerSetter.dart';


class GhostPanel_GUI{
  static getGhostPanel(BuildContext context, double width, double height, HauntingGame_ViewModel viewModel, Haunting_Ghost ghost) {

    double healthBar_Width = width * 0.75;
    double healthBar_Height = height * 0.15;

    double powersHeight = height * 0.5;
    double powersWidth = powersHeight * 4;
    double powersPadding_Right = (width - healthBar_Width) / 10;
    double powersPadding_Bottom = healthBar_Height * 2;

    double auras_Height = height;
    double auras_Width = powersPadding_Right;

    bool isGhostChosen = viewModel.chosenGhost != null && viewModel.chosenGhost!.name == ghost.name ? true : false;
    return Container(
      height: height, width: width,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          //BACKGROUND
          getBackground(context, height, width, isDefeated: ghost.isDefeated),
          //MOON
          Positioned(top: 0, left: 0, child: getMoonImage(ghost.isPlaced, height, isGhostChosen: isGhostChosen)),
          //GHOST IMAGE
          Positioned(top: 0, left: 0, child: getGhostImage(width, height, ghost, viewModel)),
          //POWERS
          if(ghost.isPlaced == true)
          Positioned(bottom: powersPadding_Bottom, right: powersPadding_Right, child: getGhostPowers(powersWidth, powersHeight, ghost, context, viewModel)),
          
          //AURAS
          // if(ghost.isDefeated == false)
          // Positioned(bottom: 0, right: 0, child: getGhostAuras(auras_Width, auras_Height, ghost, context, viewModel)),
          
          //HEALTH BAR
          Positioned(bottom: 0,
              child: getGhostHealth(context, ghost, healthBar_Width, healthBar_Height)
          ),

          //EXORCISM CRACK
          Positioned(bottom: 0, left: 0,
              child: getCrack(height, ghost.isDefeated)
          ),
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
      onLongPress: (){
        viewModel.setGameWindow_GhostData(ghost);
      },
      child: Container(
        height: height,
        child: Opacity(opacity: ghost.isPlaced == true ? 1.0 : 0.5,
          child: Image.asset('assets/images/Ghosts/${ghost.panelImage}.png', fit: BoxFit.fitHeight,),
        )
      ),
    );
  }

  static getGhostPowers(double width, double height, Haunting_Ghost ghost, BuildContext context, HauntingGame_ViewModel viewModel) {
   return Container(
      height: height, width: width,
      child: ListView.builder(
          itemCount: ghost.powers.length,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            Haunting_Power power = ghost.powers[index];
            return Button_GUI.getButton(height, power.icon,
                catalog: "Powers",
                function: () => PowerSetter.togglePowerActivation(power, game: viewModel.game),
                isIconOpacityLowered: !power.isActivated
            );
      }),
    );
  }

  static getGhostAuras(double width, double height, Haunting_Ghost ghost, BuildContext context, HauntingGame_ViewModel viewModel) {
    return Container(
      height: height, width: width,
      child: ListView.builder(
          reverse: true,
          itemCount: ghost.auras.length,
          itemBuilder: (context, index){
            Aura aura = ghost.auras[index];
            return Image.asset('assets/images/Auras/${aura.icon}.png',);
          }),
    );
  }

  static getGhostHealth(BuildContext context, Haunting_Ghost ghost, double width, double height) {
    double factor = (ghost.health_Current / ghost.health_Maximum);
    if(factor < 0) factor = 0;

    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment(-1, 0),
        children: [
          Image.asset(
            'assets/images/UI/Bars/LongBar_Background.png',
            fit: BoxFit.fill,
            height: height,
            width: width,
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: factor,
              child: Image.asset(
                'assets/images/UI/Bars/LongBar_Blue.png',
                fit: BoxFit.fill,
                height: height,
                width: width,
              ),
            ),
          ),
        ],
      ),
    );
    // return Text("${ghost.health_Current} / ${ghost.health_Maximum}");
  }

  static getBackground(BuildContext context, double height, double width, {
    bool isDefeated = false,
    Mortal_DefeatType? defeatType
  }) {
    String background = "assets/images/UI/SidePanel/Panel_Background.png";
    //GHOST / EXORCIST BACKGROUND
    if(isDefeated){ background = "assets/images/UI/SidePanel/Panel_Background_Purple.png";}
    //MORTAL BACKGROUND
    if(defeatType != null){
      switch (defeatType){
        case Mortal_DefeatType.Fear:
          background = "assets/images/UI/SidePanel/Panel_Background_Green.png";
          break;
        case Mortal_DefeatType.Faith:
          background = "assets/images/UI/SidePanel/Panel_Background_Blue.png";
          break;
        case Mortal_DefeatType.Health:
          background = "assets/images/UI/SidePanel/Panel_Background_Red.png";
          break;
        case Mortal_DefeatType.Madness:
          background = "assets/images/UI/SidePanel/Panel_Background_Yellow.png";
          break;
      }
    }

    return Container(
      height: height, width: width,
      child: Image.asset(background, fit: BoxFit.fitWidth,),
    );
  }

  static getMoonImage(bool isPlaced, double height, {
    bool isGhostChosen = false,
  }) {
    String background = "assets/images/UI/SidePanel/Moon_InActive.png";
    if(isPlaced || isGhostChosen){
      background = "assets/images/UI/SidePanel/Moon_Active.png";
    }
    return Container(
      height: height,
      child: Image.asset(background, fit: BoxFit.fitHeight,),
    );
  }

  static getCrack(double height, bool isDefeated) {
    if(isDefeated){
      return Container(
        height: height,
        child: Image.asset('assets/images/UI/SidePanel/Panel_DefeatedGhost.png', fit: BoxFit.fitHeight,),
      );
    }
    return Container();

  }

}