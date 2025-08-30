import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Screen/GUI/GhostList/OwningGhosts/GhostPanel/GhostPanel_GUI.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';

class OwningGhosts_GUI{
  static getOwningGhostList(BuildContext context, HauntingGame_ViewModel viewModel, double height, double width, Haunting_Game game) {
    if(viewModel.isGameLoaded == true){
      int itemCount = game.level.ghosts.length;
      double itemHeight = height / 5;
      return Container(
        height: height, width: width, color: Colors.amber,
        child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context, index){
              Haunting_Ghost ghost = game.level.ghosts[index];
              return GhostPanel_GUI.getGhostPanel(context, width, itemHeight, viewModel, ghost);
            }),
      );
    } else {
      return Container();
    }
  }



    // Positioned(left: 0,top: 0,
    //     child: Container(
    //       width: screenWidth * 0.2, height: screenHeight, color: Colors.amber,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Container(width: screenWidth, height: screenHeight * 0.9, color: Colors.red,
    //               child: ListView.builder(itemCount: viewModel.gameCategory == GameCategory.ghosts ? haunting_game.ghosts.length : (viewModel.gameCategory == GameCategory.mortals ? haunting_game.mortals.length : haunting_game.trappedGhosts.length),
    //                   itemBuilder: (context, index){
    //                     if(viewModel.gameCategory == GameCategory.ghosts){
    //                       return Container(
    //                         height: screenHeight * 0.3, color: Colors.green,
    //                         child: Column(mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             Row(mainAxisAlignment: MainAxisAlignment.center,
    //                               children: [
    //                                 GestureDetector(
    //                                   onTap: (){
    //                                     if(haunting_game.level.ghosts[index] == viewModel.chosenGhost){
    //                                       viewModel.setChosenGhost(null);
    //                                     } else {
    //                                       viewModel.setChosenGhost(haunting_game.level.ghosts[index]);
    //                                     }
    //                                   },
    //                                   child: Image.asset('assets/images/Ghosts/${haunting_game.level.ghosts[index].icon}.png', width: screenWidth * 0.05,),
    //                                 ),
    //                                 Container(height: screenHeight * 0.3 * 0.2, width: screenWidth * 0.1, color: Colors.blue,
    //                                   child: ListView.builder(
    //                                       itemCount: haunting_game.level.ghosts[index].auras.length,
    //                                       scrollDirection: Axis.horizontal,
    //                                       itemBuilder: (context, indexAura) {
    //                                         return Image.asset('assets/images/Auras/${haunting_game.level.ghosts[index].auras[indexAura].icon}.png');
    //                                       }),
    //
    //                                 )
    //                               ],),
    //                             if(viewModel.chosenGhost == haunting_game.level.ghosts[index])
    //                               Text("Wybrany"),
    //                             Container(height: screenHeight * 0.1, width: screenWidth * 0.2, color: Colors.yellow,
    //                               child: ListView.builder(
    //                                   itemCount: haunting_game.ghosts[index].powers.length,
    //                                   scrollDirection: Axis.horizontal,
    //                                   itemBuilder: (context, indexPower){
    //                                     return GestureDetector(
    //                                         onTap: (){
    //                                           PowerSetter.togglePowerActivation(haunting_game.level.ghosts[index].powers[indexPower]);
    //                                           // haunting_game.level.ghosts[index].powers[indexPower].use();
    //                                           viewModel.refresh();
    //                                         },
    //                                         child: Opacity(opacity: haunting_game.level.ghosts[index].powers[indexPower].isActivated ? 1.0 : 0.5, child: Stack(
    //                                           children: [
    //                                             Image.asset('assets/images/Powers/${haunting_game.level.ghosts[index].powers[indexPower].icon}.png', width: screenWidth * 0.04,),
    //                                             // Text(haunting_game.level.ghosts[index].powers[indexPower].currentCooldown.toString())
    //                                           ],
    //                                         ),)
    //                                     );
    //                                   }),
    //                             ),
    //                           ],),
    //                       );
    //                     }
    //                     else if (viewModel.gameCategory == GameCategory.mortals) {
    //                       return Container(
    //                         height: screenHeight * 0.25,
    //                         color: haunting_game.level.mortals[index].isDefeated ? Colors.red : Colors.green,
    //                         child: Row(mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             Image.asset('assets/images/Mortals/${haunting_game.mortals[index].icon}.png', width: screenWidth * 0.07,),
    //                             Column(mainAxisAlignment: MainAxisAlignment.center,
    //                               children: [
    //                                 // Text("${haunting_game.level.mortals[index].name} "),
    //                                 Text("${haunting_game.level.mortals[index].stat_Current_Health} / ${haunting_game.level.mortals[index].stat_Health}"),
    //                                 Text("${haunting_game.level.mortals[index].stat_Current_Fear} / ${haunting_game.level.mortals[index].stat_Fear}"),
    //                                 Text("${haunting_game.level.mortals[index].stat_Current_Madness} / ${haunting_game.level.mortals[index].stat_Madness}"),
    //                                 Text("${haunting_game.level.mortals[index].stat_Current_Faith} / ${haunting_game.level.mortals[index].stat_Faith}"),
    //                               ],)
    //                           ],),
    //                       );
    //                     } else if (viewModel.gameCategory == GameCategory.trapped){
    //                       return Container(
    //                         height: screenHeight * 0.3, color: Colors.green,
    //                         child: Column(mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             Row(mainAxisAlignment: MainAxisAlignment.center,
    //                               children: [
    //                                 GestureDetector(
    //                                   onTap: (){
    //                                     // if(haunting_game.level.ghosts[index] == viewModel.chosenGhost){
    //                                     //   viewModel.setChosenGhost(null);
    //                                     // } else {
    //                                     //   viewModel.setChosenGhost(haunting_game.level.ghosts[index]);
    //                                     // }
    //                                   },
    //                                   child: Image.asset('assets/images/Ghosts/${haunting_game.level.trappedGhosts[index].icon}.png', width: screenWidth * 0.05,),
    //                                 ),
    //                                 Container(height: screenHeight * 0.3 * 0.2, width: screenWidth * 0.1, color: Colors.blue,
    //                                   child: ListView.builder(
    //                                       itemCount: haunting_game.level.trappedGhosts[index].auras.length,
    //                                       scrollDirection: Axis.horizontal,
    //                                       itemBuilder: (context, indexAura) {
    //                                         return Image.asset('assets/images/Auras/${haunting_game.level.trappedGhosts[index].auras[indexAura].icon}.png');
    //                                       }),
    //
    //                                 )
    //                               ],),
    //                             if(viewModel.chosenGhost == haunting_game.level.ghosts[index])
    //                               Text("Wybrany"),
    //                             Container(height: screenHeight * 0.1, width: screenWidth * 0.2, color: Colors.yellow,
    //                               child: ListView.builder(
    //                                   itemCount: haunting_game.trappedGhosts[index].powers.length,
    //                                   scrollDirection: Axis.horizontal,
    //                                   itemBuilder: (context, indexPower){
    //                                     return GestureDetector(
    //                                         onTap: (){
    //                                           PowerSetter.togglePowerActivation(haunting_game.level.trappedGhosts[index].powers[indexPower]);
    //                                           // haunting_game.level.ghosts[index].powers[indexPower].use();
    //                                           viewModel.refresh();
    //                                         },
    //                                         child: Opacity(opacity: haunting_game.level.trappedGhosts[index].powers[indexPower].isActivated ? 1.0 : 0.5, child: Stack(
    //                                           children: [
    //                                             Image.asset('assets/images/Powers/${haunting_game.level.trappedGhosts[index].powers[indexPower].icon}.png', width: screenWidth * 0.04,),
    //                                             // Text(haunting_game.level.ghosts[index].powers[indexPower].currentCooldown.toString())
    //                                           ],
    //                                         ),)
    //                                     );
    //                                   }),
    //                             ),
    //                           ],),
    //                       );
    //                     }
    //
    //                   })
    //           ),
    //           Container(width: screenWidth, height: screenHeight * 0.1, color: Colors.blue,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Expanded(child:
    //                 ElevatedButton(onPressed: (){viewModel.setGameCategory(GameCategory.ghosts) ;print(viewModel.gameCategory);}, child: Text("D")),
    //                 ),
    //                 Expanded(child:
    //                 ElevatedButton(onPressed: (){viewModel.setGameCategory(GameCategory.mortals);print(viewModel.gameCategory);}, child: Text("M")),
    //                 ),
    //                 Expanded(child:
    //                 ElevatedButton(onPressed: (){viewModel.setGameCategory(GameCategory.trapped);print(viewModel.gameCategory);}, child: Text("T")),
    //                 ),
    //
    //               ],
    //             ),),
    //         ],
    //       ),
    //     )
    // ),



}