import 'package:flame_tiled/flame_tiled.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Level/Haunting_Level.dart';
import 'package:tiled/src/objects/tiled_object.dart';

import '../../Classes/Effect/Room/Haunting_Effect.dart';
import '../../Classes/Room/Getter/RoomGetter.dart';
import '../../Haunting_Game.dart';

class LoadEffect{
  static void loadEffect(TiledObject spawnPoint, Haunting_Game game) {
    int effectIndex = spawnPoint.properties.getValue('effectIndex');
    String roomName = spawnPoint.properties.getValue('roomName');
    final room = RoomGetter.getRoomByName(roomName, game);
    if(room!=null){
      final effect = Haunting_Effect(index: effectIndex, position: spawnPoint.position, size: spawnPoint.size)..room = room;
      game.level.level.add(effect);
      room.effects.add(effect);
    }
  }

}