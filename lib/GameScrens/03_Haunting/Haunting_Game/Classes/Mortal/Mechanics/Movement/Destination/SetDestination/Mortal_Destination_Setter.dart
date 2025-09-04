import 'dart:math';

import 'package:flame/components.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Navigator.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';

import '../../../../../../Haunting_Game.dart';
import '../../../../../Astar/AStar.dart';
import '../../../../../Room/SubClasses/Stairs/Getter/StairsGetter.dart';
import '../../../../../Room/SubClasses/Stairs/Hauning_Stairs.dart';
import '../../../../Haunting_Mortal.dart';
import '../GetDestination/Mortal_Destination_Getter.dart';

class Mortal_Destination_Setter{
  static Random random = Random();

  //METHOD FOR SETTING NEXT DESTINATION FOR MORTAL
  // static void setNextDestination(Haunting_Mortal mortal, Haunting_Game game) {
  //   //RANDOMIZING NEXT DESTINATION WITH PERCENTAGES - 15% CHANCES FOR MORTAL
  //   //TO GO TO SPECIAL LOCATION (EXAMPLE - STAIRS, QUEST), THE REST IS STAYING AT CURRENT FLOOR
  //   double r = random.nextDouble();
  //   if (r < 0.15) {
  //     //SPECIAL ACTION
  //     print("Mortal ${mortal.name} chce zmienić piętro");
  //     Vector2? destination = Mortal_Destination_Getter.getNextDestination_Special(mortal.floor!.listStairs);
  //     //IF THERE IS NO SPECIAL POINT AT FLOOR
  //     if(destination != null){
  //       mortal.currentDestination = destination;
  //     } else {
  //       //DESTINATION AT FLOOR
  //       mortal.currentDestination = Mortal_Destination_Getter.getNextDestination(mortal.floor!.mortalActionPoints);
  //     }
  //   } else {
  //     //DESTINATION AT FLOOR
  //     mortal.currentDestination = Mortal_Destination_Getter.getNextDestination(mortal.floor!.mortalActionPoints);
  //   }
  //   setNextDestinationPath(mortal, game);
  // }

  static void setNextDestinationPath(Haunting_Mortal mortal, Haunting_Game game) {
    if(mortal.currentDestination != null){
      List<Vector2> path = findPathAStar(
        game.level.walkableGrid,
        worldToGrid(mortal.position),
        worldToGrid(mortal.currentDestination!),
      );
      if(path.isNotEmpty){
        mortal.path = path.map((p) => gridToWorld(p)).toList();
      } else {
        Mortal_Destination_Navigator.setMortalNextDestination_Navigator(mortal, game);
      }

    }

  }

  static void forceNextDestination(Haunting_Mortal mortal, Haunting_Game game, Vector2? destinationPoint) {
    Mortal_Setter.setCurrentDestination(mortal, destinationPoint);
    setNextDestinationPath(mortal, game);
  }

  static void setRandomDestination_ByFloor(Haunting_Mortal mortal, Haunting_Game game){
    Vector2 destination = Mortal_Destination_Getter.getNextDestination(mortal.floor!.mortalActionPoints);
    forceNextDestination(mortal, game, destination);
  }

  static void setFinalDestination(Haunting_Mortal mortal, Haunting_Game game){
    //IF THERE IS A NEED TO CHANGE FLOOR
    if(mortal.floor != mortal.finalFloor){
       var mortalFloorID = mortal.floor!.id;
       var mortalFinalFloorID = mortal.finalFloor!.id;
       int modifier = 0;

       if(mortalFloorID > mortalFinalFloorID){
         modifier = -1;
       } else {
         modifier = 1;
       }

       Haunting_Stairs? stairs = StairsGetter.getStairsAtFloor_SearchByModifier(mortal.floor!, modifier);
       if(stairs != null){
         Vector2 stairsLocation = stairs.position;
         // Mortal_Destination_Setter.forceNextDestination(mortal, game, stairsLocation);
         Mortal_Destination_Navigator.setMortalNextDestination_Navigator(mortal, game, destinationPoint: stairsLocation);
       }

    } else { //MORTAL IS AT THE SAME FLOOR AS FINAL POINT
      Vector2? destination = mortal.finalDestination;
      if(destination != null){
        forceNextDestination(mortal, game, destination);
      }
    }
  }

}