import 'package:flame_tiled/flame_tiled.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/GhostSpot/GhostSpot_Type.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:tiled/src/objects/tiled_object.dart';

import '../../Classes/Room/Getter/RoomGetter.dart';
import '../../Classes/Room/SubClasses/GhostSpot/Haunting_GhostSpot.dart';

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

}