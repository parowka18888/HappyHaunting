import 'dart:math';

import 'package:flame/src/game/notifying_vector2.dart';
import 'package:happyhaunting/Data/Database/Enums/Mortal_State.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/StaticData/Mortal_StaticData.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Haunting_InteractiveObject.dart';

import '../../../../Haunting_Game.dart';
import '../../../Astar/AStar.dart';
import 'package:flame/components.dart';

class Mortal_Setter extends SpriteComponent with HasGameReference<Haunting_Game>{

  static void setPosition(Haunting_Mortal mortal, NotifyingVector2 position) {
    mortal.position = position;
  }

  static void setFloor(Haunting_Mortal mortal, Haunting_Floor floor) {
    mortal.floor = floor;
  }

  static void setCanChangeFloors(Haunting_Mortal mortal, bool bool) {
    mortal.canChangeFloor = bool;
  }

  static void setRoom(Haunting_Mortal mortal, Haunting_Room? room) {
    mortal.room = room;
  }

  static void setCurrentDestination(Haunting_Mortal mortal, Vector2? nextDestination) {
    mortal.currentDestination = nextDestination;
  }

  static void setFinalData(Haunting_Mortal mortal, Vector2? nextDestination, Haunting_Floor? floor) {
    mortal.finalDestination = nextDestination;
    mortal.finalFloor = floor;
  }

  static void setDestinationAndPath(Haunting_Mortal mortal, Vector2? destination, List<Vector2> path) {
    mortal.currentDestination = destination;
    mortal.path = path;
  }

  static void setState(Haunting_Mortal mortal, Mortal_State state) {
    mortal.state = state;
    double speed = Mortal_StaticData.getMortalSpeedByState(state);
    setSpeed(mortal, speed);
  }

  static void setSpeed(Haunting_Mortal mortal, double speed) {
    mortal.speed = speed;
  }

  static Future<void> setIsActiveData(Haunting_Mortal mortal, Haunting_Game game) async {
    if(mortal.isActive == true){
      mortal.sprite = await game.loadSprite('Mortals/${mortal.icon}.png');
    } else {
      mortal.sprite = await game.loadSprite('UI/EmptySlot.png');
    }
  }

  static void setIsActive(Haunting_Mortal mortal, bool value) {
    mortal.isActive = value;
  }

  static void setIsScriptExecuted(Haunting_Mortal mortal, bool bool) {
    mortal.isScriptExecuted = bool;
  }

  static void setTimeOfThinking(Haunting_Mortal mortal, double time, {
    bool canMove = false
  }) {
    mortal.timeOfThinking = time;
    mortal.canMove = canMove;
  }

  static void setIsFearUnlocked(Haunting_Mortal mortal, bool bool) {
    mortal.isFearUnlocked = bool;
  }

  static void setFinalDestination(Haunting_Mortal mortal, point, floor) {
    mortal.finalFloor = floor;
    mortal.finalDestination = point;
  }

  static void setPickUp(Haunting_Mortal mortal, Haunting_InteractiveObject? object) {
    mortal.pickUp!.interactiveObject = object;
    mortal.pickUp!.isObjectChanged = true;
  }



}