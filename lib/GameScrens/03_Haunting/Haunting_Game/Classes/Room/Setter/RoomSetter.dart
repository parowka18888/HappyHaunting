import 'dart:ui';

import 'package:flame/components.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/CheckConditions/RoomCheckConditions.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';

class RoomSetter{
  static void setRoomColor(Haunting_Room room, HauntingGame_ViewModel viewModel) {
    if(viewModel.chosenGhost != null && RoomCheckConditions.checkIf_GhostCanBePlaced_ByAura(viewModel.chosenGhost!, room)){
        room.paint.color = const Color.fromRGBO(9, 255, 240, 0.5);

    } else {
      room.paint.color = const Color.fromRGBO(9, 255, 240, 0.0);
    }
  }

  static void setBoundingBox(Haunting_Room room, List<Vector2> polygon) {

    final points = polygon.map((p) => p + room.position).toList();

    double minX = points.first.x;
    double minY = points.first.y;
    double maxX = points.first.x;
    double maxY = points.first.y;

    for (final v in points) {
      if (v.x < minX) minX = v.x;
      if (v.y < minY) minY = v.y;
      if (v.x > maxX) maxX = v.x;
      if (v.y > maxY) maxY = v.y;
    }

    room.boundingBox = Rect.fromLTRB(minX, minY, maxX, maxY);
  }

  static void removeMortalFromMortalsInRoom(Haunting_Room room, Haunting_Mortal mortal) {
    room.mortalsInRoom.removeWhere((mortalInRoom) => mortalInRoom.name == mortal.name);
  }

}