import 'package:flame/src/events/messages/tap_down_event.dart';
import 'package:flame/src/game/notifying_vector2.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/04_Aura.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/GhostSpot/GhostSpot_Type.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/CheckConditions/RoomCheckConditions.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:vector_math/vector_math.dart';

import '../../../GhostSpot/Getter/GhostSpotGetter.dart';
import '../../../GhostSpot/Haunting_GhostSpot.dart';
import '../../../GhostSpot/Mechanics/GhostSpot_Mechanics.dart';
import '../../../GhostSpot/Particle/GhostSpot_Particle.dart';
import '../../../Power/Haunting_Power.dart';
import '../../../Power/Setter/PowerSetter.dart';

class RoomGhost{
  static void placeGhost(Haunting_Game game, Haunting_Room room) {
    var chosenGhost = game.viewModel.chosenGhost;
    if(chosenGhost != null && RoomCheckConditions.checkIf_GhostCanBePlaced_ByAura(chosenGhost, room)){
      for(var ghostSpot in room.ghostSpots){
        if(ghostSpot.ghost == null && ghostSpot.type == GhostSpot_Type.room){
          if(chosenGhost.isPlaced == true){
            Haunting_GhostSpot? previousGhostSpot = GhostSpotGetter.getGhostSpotByGhost(game, chosenGhost);
            if(previousGhostSpot == null){
              break;
            } else {
              clearSpotFromGhost(game, previousGhostSpot);
            }
          }
          GhostSpot_Mechanics.placeGhostAtGhostSpot(ghostSpot, chosenGhost, game, room);
          print("TUTAJ");
          break;
        }
      }
    }
  }

  static void clearSpotFromGhost(Haunting_Game game, Haunting_GhostSpot spot, {
    Vector2? localPosition,
    bool powersDeactivation = true
  }) {
    if(spot.ghost != null){
      if(powersDeactivation){
        for(Haunting_Power power in spot.ghost!.powers){
          PowerSetter.setPowerActivation(power, false);
        }
      }
      spot.ghost!.ghostSpot = null;
      spot.ghost!.isPlaced = false;
      spot.ghost!.room = null;
      spot.ghost = null;
      game.viewModel.setChosenGhost(null);
      if(localPosition != null){
        GhostSpot_Particle.clearSpot_Particle(localPosition, spot);
      }
    }
  }

}