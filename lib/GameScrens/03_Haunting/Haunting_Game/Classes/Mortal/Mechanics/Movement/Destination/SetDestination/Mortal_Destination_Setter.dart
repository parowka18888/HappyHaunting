import 'dart:math';

import 'package:flame/components.dart';

import '../../../../../../Haunting_Game.dart';
import '../../../../../Astar/AStar.dart';
import '../../../../Haunting_Mortal.dart';
import '../Mortal_Destination.dart';

class Mortal_Destination_Setter{
  static Random random = Random();

  //METHOD FOR SETTING NEXT DESTINATION FOR MORTAL
  static void setNextDestination(Haunting_Mortal mortal, Haunting_Game game) {
    //RANDOMIZING NEXT DESTINATION WITH PERCENTAGES - 15% CHANCES FOR MORTAL
    //TO GO TO SPECIAL LOCATION (EXAMPLE - STAIRS, QUEST), THE REST IS STAYING AT CURRENT FLOOR
    double r = random.nextDouble();
    if (r < 0.15) {
      //SPECIAL ACTION
      print("Mortal ${mortal.name} chce zmienić piętro");
      Vector2? destination = Mortal_Destination.getNextDestination_Special(mortal.floor!.listStairs);
      //IF THERE IS NO SPECIAL POINT AT FLOOR
      if(destination != null){
        mortal.currentDestination = destination;
      } else {
        //DESTINATION AT FLOOR
        mortal.currentDestination = Mortal_Destination.getNextDestination(mortal.floor!.mortalActionPoints);
      }
    } else {
      //DESTINATION AT FLOOR
      mortal.currentDestination = Mortal_Destination.getNextDestination(mortal.floor!.mortalActionPoints);
    }
    setNextDestinationPath(mortal, game);
  }

  static void setNextDestinationPath(Haunting_Mortal mortal, Haunting_Game game) {
    List<Vector2> path = findPathAStar(
      game.level.walkableGrid,
      worldToGrid(mortal.position),
      worldToGrid(mortal.currentDestination),
    );
    mortal.path = path.map((p) => gridToWorld(p)).toList();
  }

}