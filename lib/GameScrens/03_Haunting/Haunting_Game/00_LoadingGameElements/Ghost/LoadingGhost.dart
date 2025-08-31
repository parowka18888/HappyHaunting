import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/01_Power.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/GhostScript/GhostScript.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Haunting_GhostSpot.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../../../Data/Database/Enums/Getter/EnumGetter.dart';
import '../../../../../Data/Database/Enums/PowerType.dart';
import '../../Classes/Ghost/Haunting_Ghost.dart';
import '../../Classes/Ghost/Subclasses/Power/Haunting_Power.dart';

class LoadingGhost{
  static Haunting_Ghost loadGhost(Ghost ghost, Haunting_Game game, List<Haunting_Ghost> ghosts, {
    bool isPlaced = false,
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
    var hauntingGhost = Haunting_Ghost(name: ghost.name, icon: ghost.icon, powers: powers, auras: ghost.auras)
      ..isPlaced = isPlaced
      ..room = room
    ..ghostSpot = ghostSpot
    ..hintText = hintText
    ..freeingText = freeingText
    ..script = script
    ;
    ghosts.add(hauntingGhost);
    return hauntingGhost;
  }

  static void loadPower(Power ghostPower, Haunting_Game game, List<Haunting_Power> powers) {
    PowerType type = EnumGetter.getPowerTypeByString(ghostPower.powerType);
    Haunting_Power power = Haunting_Power(id: ghostPower.id, name: ghostPower.name, description: ghostPower.description,
        icon: ghostPower.icon, cost: ghostPower.cost, cooldown: ghostPower.cooldown,
        stat_Fear: ghostPower.stat_Fear, stat_Health: ghostPower.stat_Health, stat_Madness: ghostPower.stat_Madness, stat_Faith: ghostPower.stat_Faith,
        isActivated: false, isDeactivatingForbidden: false, powerType:  type, powerTime : ghostPower.powerTime
    );
    game.level.level.add(power);
    powers.add(power);
  }
  
}