import 'dart:math';

import 'package:flame/components.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/StaticData/Mortal_StaticData.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Getter/InteractiveObject_Getter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Haunting_InteractiveObject.dart';

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

    decideDestination_OnFloor(mortal, game);
  }

  static void decideDestination_OnFloor(Haunting_Mortal mortal, Haunting_Game game) {

    bool isDecisionMade = false;
    isDecisionMade = decideDestination_Stairs(mortal, game);
    if(isDecisionMade == true) return;
    isDecisionMade = decideDestination_InteractiveObjects(mortal, game);
    if(isDecisionMade == true) return;
    Mortal_Destination_Setter.setRandomDestination_ByFloor(mortal, game);


    // double r = random.nextDouble();
    // if (r < 0.15) {
    //   Vector2? destination = Mortal_Destination_Getter.getNextDestination_ByList(mortal.floor!.listStairs);
    //   Mortal_Destination_Setter.forceNextDestination(mortal, game, destination);
    // } else {
    //   Mortal_Destination_Setter.setRandomDestination_ByFloor(mortal, game);
    // }
  }

  static bool decideDestination_Stairs(Haunting_Mortal mortal, Haunting_Game game) {
    double r = random.nextDouble();
    double changingFloorChance = Mortal_StaticData.getChanceForChangingFloor_ByState(mortal.state);
    var list = mortal.floor!.listStairs;
    if (r < changingFloorChance && list.isNotEmpty) {
      // print("MORTAL ${mortal.name} Podjął decyzję - schody, z szansą ${changingFloorChance}");
      Vector2? destination = Mortal_Destination_Getter.getNextDestination_ByList(list);
      Mortal_Destination_Setter.forceNextDestination(mortal, game, destination);
      return true;
    }
    return false;
  }

  static bool decideDestination_InteractiveObjects(Haunting_Mortal mortal, Haunting_Game game) {
    double r = random.nextDouble();
    double interactiveObjectChance = Mortal_StaticData.getChanceForInteractiveObject_ByState(mortal.state);
    var list = mortal.floor!.listInteractiveObjects.where((object) => object.canBeUsed == true && object.isActive == true).toList();
    if (r < interactiveObjectChance && list.isNotEmpty) {
      Haunting_InteractiveObject? interactiveObject = InteractiveObject_Getter.getRandomInteractiveObject_ByList(list);
      if(interactiveObject != null){
        Vector2? destination = interactiveObject.position;
        Mortal_Destination_Setter.forceNextDestination(mortal, game, destination);
        interactiveObject.canBeUsed = false;
        return true;
      }
    }
    return false;
  }
}