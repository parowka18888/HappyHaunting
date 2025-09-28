import 'package:flame_tiled/flame_tiled.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:tiled/src/objects/tiled_object.dart';

import '../../Classes/Room/Getter/RoomGetter.dart';
import '../../Classes/Room/SubClasses/Aura/Haunting_Aura.dart';

class LoadAura{
  static void loadAura(TiledObject spawnPoint, Haunting_Game game) {
    final roomName = spawnPoint.properties.getValue('roomName');
    final auraIndex = spawnPoint.properties.getValue('auraIndex');
    final room = RoomGetter.getRoomByName(roomName, game);
    if(room!=null){
      if(room.auras.length > auraIndex){
        final aura = Haunting_Aura(aura: room.auras[auraIndex], size: spawnPoint.size, position: spawnPoint.position);
        game.level.level.add(aura);
      }
    }
  }

}