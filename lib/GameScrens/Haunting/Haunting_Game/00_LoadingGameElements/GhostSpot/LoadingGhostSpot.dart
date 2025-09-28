import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/GhostSpot/GhostSpot_Type.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:tiled/src/objects/tiled_object.dart';

import '../../Classes/GhostSpot/Haunting_GhostSpot.dart';
import '../../Classes/Room/Getter/RoomGetter.dart';

class LoadingGhostSpot{
  static Haunting_GhostSpot? loadGhostSpot(TiledObject spawnPoint, Haunting_Game game,{
    GhostSpot_Type type = GhostSpot_Type.room
  }) {
    final ghostSpot = Haunting_GhostSpot(
        position: spawnPoint.position,
        size: spawnPoint.size,
        id: spawnPoint.name)..type = type;
    game.level.ghostSpots.add(ghostSpot);
    final roomName = spawnPoint.properties.getValue('roomName');
    final room = RoomGetter.getRoomByName(roomName, game);
    if(room!=null) room.ghostSpots.add(ghostSpot);
    game.level.level.add(ghostSpot);
    return ghostSpot;
  }

  static Haunting_GhostSpot loadGhostSpotForMortal(TiledObject spawnPoint, Haunting_Game game, Haunting_Mortal mortal) {
    Vector2 size = spawnPoint.size;
    Vector2 position = spawnPoint.position;

    double sizeModifier = 0.6;
    size.x = size.x * sizeModifier;
    size.y = size.y * sizeModifier;

    position.x = spawnPoint.size.x - size.x / 2;
    position.y = spawnPoint.size.y - size.y / 2;

    final ghostSpot = Haunting_GhostSpot(
        position: position,
        size: size,
        id: spawnPoint.name)..type = GhostSpot_Type.mortal;
    mortal.add(ghostSpot);
    game.level.ghostSpots.add(ghostSpot);
    return ghostSpot;

  }

}