import 'dart:math';

import 'package:flame/src/game/notifying_vector2.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';

import '../../../../Haunting_Game.dart';
import '../../../Astar/AStar.dart';
import '../Movement/Destination/Mortal_Destination.dart';
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

  static void setCurrentDestination(Haunting_Mortal mortal, Vector2 nextDestination) {
    mortal.currentDestination = nextDestination;
  }

  static void setFinalData(Haunting_Mortal mortal, Vector2 nextDestination, Haunting_Floor floor) {
    mortal.finalDestination = nextDestination;
    mortal.finalFloor = floor;
  }



}