import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Level/Subclasses/Getter/FloorGetter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/UsedPowers/UsedPowers.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

import '../../Power/Haunting_Power.dart';

class UsedPowers_ManagingObjects{

  static void addUsedPower(Haunting_Game game, Haunting_Power power, Haunting_Ghost ghost, Haunting_Room room) {
    Haunting_Floor? floor = FloorGetter.getFloorByRoom(room, game);
    if(floor != null){
      UsedPower usedPower = UsedPower(power: power, room: room, floor: floor, ghost: ghost);
      game.level.usedPowers.add(usedPower);
    }
  }

}