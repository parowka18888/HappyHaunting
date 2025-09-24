import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';

import '../../../../../../Data/Database/DatabaseStructure/04_Aura.dart';

class RoomCheckConditions {
  static bool checkIf_GhostCanBePlaced_ByAura(Haunting_Ghost chosenGhost, Haunting_Room room) {
    List<Aura> ghostAuras = chosenGhost.auras;
    List<Aura> roomAuras = room.auras;
    for(Aura ghostAura in ghostAuras){
      for(Aura roomAura in roomAuras){
        if(ghostAura.name == roomAura.name){
          return true;
        }
      }
    }
    return false;
  }

}