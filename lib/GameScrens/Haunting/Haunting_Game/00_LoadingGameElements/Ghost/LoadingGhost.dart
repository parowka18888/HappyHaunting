import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/01_Power.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/GhostScript/GhostScript.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:tiled/src/objects/tiled_object.dart';

import '../../../../../Data/Database/Enums/Getter/EnumGetter.dart';
import '../../../../../Data/Database/Enums/Haunting/GhostSpot/GhostSpot_Type.dart';
import '../../../../../Data/Database/Enums/PowerType.dart';
import '../../Classes/Ghost/Haunting_Ghost.dart';
import '../../Classes/Ghost/Subclasses/TrappedGhost/Getter/TrappedGhost_Getter.dart';
import '../../Classes/GhostSpot/Haunting_GhostSpot.dart';
import '../../Classes/Power/Haunting_Power.dart';
import '../../Classes/Room/Getter/RoomGetter.dart';
import '../GhostSpot/LoadingGhostSpot.dart';

class LoadingGhost{
  static Haunting_Ghost loadGhost(Ghost ghost, Haunting_Game game, List<Haunting_Ghost> ghosts, {
    bool isPlaced = false,
    bool isFree = true,
    Haunting_Room? room,
    Haunting_GhostSpot? ghostSpot,
    String? hintText,
    String? freeingText,
    GhostScript? script
  }) {
    List<Haunting_Power> powers = [];
    for(var ghostPower in ghost.powers){
      loadPower(ghostPower, game, powers);
    }
    var hauntingGhost = Haunting_Ghost(
        name: ghost.name, icon: ghost.icon,powers: powers, auras: ghost.auras,
        id: ghost.id, health_Current: ghost.health, health_Maximum: ghost.health,
        image: ghost.ghostImage, panelImage: "${ghost.ghostImage}_Panel", color: ghost.color,
        banishText: ghost.banishingText
    )
      ..isPlaced = isPlaced
      ..room = room
    ..ghostSpot = ghostSpot
    ..hintText = hintText
    ..freeingText = freeingText
    ..script = script
    ..isFree = isFree
    ;
    ghosts.add(hauntingGhost);
    game.add(hauntingGhost);
    return hauntingGhost;
  }

  static void loadPower(Power ghostPower, Haunting_Game game, List<Haunting_Power> powers) {
    PowerType type = EnumGetter.getPowerTypeByString(ghostPower.powerType);
    Haunting_Power power = Haunting_Power(id: ghostPower.id, name: ghostPower.name, description: ghostPower.description,
        icon: ghostPower.icon, cost: ghostPower.cost, cooldown: ghostPower.cooldown, powerTags: ghostPower.powerTags,
        stat_Fear: ghostPower.stat_Fear, stat_Health: ghostPower.stat_Health, stat_Madness: ghostPower.stat_Madness, stat_Faith: ghostPower.stat_Faith,
        isActivated: false, isDeactivatingForbidden: false, powerType:  type, powerTime : ghostPower.powerTime
    );
    game.level.level.add(power);
    powers.add(power);
  }

  static void loadTrappedGhost(TiledObject spawnPoint, Haunting_Game game) {
    Haunting_GhostSpot? ghostSpot = LoadingGhostSpot.loadGhostSpot(spawnPoint, game);
    if(ghostSpot != null){
      final ghostID = spawnPoint.properties.getValue('ghostID');
      final roomName = spawnPoint.properties.getValue('roomName');

      final hintText = spawnPoint.properties.getValue('hintText');
      final freeingGhostText = spawnPoint.properties.getValue('freeingGhostText');
      final scriptID = spawnPoint.properties.getValue('scriptID');
      final GhostScript script = GhostScript.values.byName(scriptID);

      final room = RoomGetter.getRoomByName(roomName, game);
      final trappedGhost = TrappedGhost_Getter.getTrappedGhost_ByID(ghostID, game);
      if(room!=null && trappedGhost != null){
        Haunting_Ghost ghost = LoadingGhost.loadGhost(trappedGhost, game, game.level.trappedGhosts, isPlaced: true, room: room, ghostSpot: ghostSpot, hintText: hintText, freeingText: freeingGhostText, script: script, isFree: false);
        ghostSpot.type = GhostSpot_Type.trap;
        ghostSpot.ghost = ghost;
        ghostSpot.ghost!.isDefeatable = false;
      }
    }
  }
  
}