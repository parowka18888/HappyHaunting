import 'dart:math';

import 'package:flame/components.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Setter.dart';

import '../../../../../../Haunting_Game.dart';
import '../../../../Haunting_Mortal.dart';
import '../GetDestination/Mortal_Destination_Getter.dart';

class Mortal_Destination_Navigator{

  static Random random = Random();

  static void setMortalNextDestination_Navigator(Haunting_Mortal mortal, Haunting_Game game, {
    List<Vector2>? listOfAvailableDestinationPoints,
    Vector2? destinationPoint
  }){

    if(destinationPoint != null){
      Mortal_Destination_Setter.forceNextDestination(mortal, game, destinationPoint);
      return;
    }

    if(mortal.finalFloor != null && mortal.finalDestination != null){
      Mortal_Destination_Setter.setFinalDestination(mortal, game);
      return;
    }


    double r = random.nextDouble();
    if (r < 0.15) {
      Vector2? destination = Mortal_Destination_Getter.getNextDestination_Stairs(mortal.floor!.listStairs);
      Mortal_Destination_Setter.forceNextDestination(mortal, game, destination);
    } else {
      Mortal_Destination_Setter.setRandomDestination_ByFloor(mortal, game);
    }


  }
}