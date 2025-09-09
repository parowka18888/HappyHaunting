import 'dart:math';

import 'package:flame/components.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/StaticData/Mortal_StaticData.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Getter/InteractiveObject_Getter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Haunting_InteractiveObject.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/Stairs/Hauning_Stairs.dart';

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

    //CHOOSING DESTINATION
      //STAIRS
    bool isDecisionMade = false;
    isDecisionMade = decideDestination(
        mortal, game,
        Mortal_StaticData.getChanceForChangingFloor_ByState(mortal.state),
        mortal.floor!.listStairs
    );
    if(isDecisionMade == true) return;

    //SEDUCING OBJECTS
    isDecisionMade = decideDestination(
        mortal, game,
        Mortal_StaticData.getChanceForSeducingObject_ByState(mortal.state),
        InteractiveObject_Getter.getInteractiveObjectsList_InRoom_ByMortal(mortal, game, isSeductive: true)
    );
    if(isDecisionMade == true) return;

    //INTERACTIVE OBJECTS
    isDecisionMade = decideDestination(
        mortal, game,
        Mortal_StaticData.getChanceForInteractiveObject_ByState(mortal.state),
        InteractiveObject_Getter.getInteractiveObjectsList_InRoom_ByMortal(mortal, game)
    );
    if(isDecisionMade == true) return;


    Mortal_Destination_Setter.setRandomDestination_ByFloor(mortal, game);

  }

  static bool decideDestination<T>(Haunting_Mortal mortal, Haunting_Game game, double chanceOfChoosing, List<T> list) {
    double r = random.nextDouble();
    bool destinationIsSet = false;
    if (r < chanceOfChoosing && list.isNotEmpty) {
      if(list is List<Haunting_Stairs>) destinationIsSet = decideDestination_Stairs(mortal, game, list.cast<Haunting_Stairs>());
      if(list is List<Haunting_InteractiveObject>) destinationIsSet = decideDestination_InteractiveObjects(mortal, game, list.cast<Haunting_InteractiveObject>());
    }
    return destinationIsSet;
  }

  static bool decideDestination_Stairs(Haunting_Mortal mortal, Haunting_Game game, List<Haunting_Stairs> list) {
    Vector2? destination = Mortal_Destination_Getter.getNextDestination_ByList(list);
    Mortal_Destination_Setter.forceNextDestination(mortal, game, destination);
    return true;
  }

  static bool decideDestination_InteractiveObjects(Haunting_Mortal mortal, Haunting_Game game, List<Haunting_InteractiveObject> list) {
    Haunting_InteractiveObject? interactiveObject = InteractiveObject_Getter.getRandomInteractiveObject_ByList(list);
    if(interactiveObject != null) {
      Vector2? destination = interactiveObject.position;
      Mortal_Destination_Setter.forceNextDestination(mortal, game, destination);
      interactiveObject.canBeUsed = false;
      return true;
    }
    return false;
  }
}