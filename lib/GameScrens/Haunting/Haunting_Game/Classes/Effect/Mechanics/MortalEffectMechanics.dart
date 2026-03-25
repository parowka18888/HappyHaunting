import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Getter/GhostGetter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/GhostSpot/Getter/GhostSpotGetter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/GhostSpot/Haunting_GhostSpot.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/GhostSpot/Mechanics/GhostSpot_Mechanics.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';

import '../../Mortal/StaticData/Mortal_StaticData.dart';

class MortalEffectMechanics{

  static void setMortalSpeed(Haunting_Mortal mortal, Haunting_MortalEffect effect, int speed) {
    mortal.speed = 0;
    if(effect.timeLeft <= 1) {
      mortal.speed = Mortal_StaticData.getMortalSpeedByState(mortal.state, effect.game);
    }
  }

  static void reduceMortalSpeedByPercentageValue(Haunting_Mortal mortal, Haunting_MortalEffect effect, double percentage) {

    double value = (percentage / 100);
    double multiplier = 1 - value;
    mortal.speedMultipliersMap[effect] = multiplier;

    if(effect.timeLeft <= 1){
      mortal.speedMultipliersMap.remove(effect);
    }
  }

  static void policeman_Chase(Haunting_Power power, Haunting_Mortal mortal, Haunting_MortalEffect effect) {
    if(effect.timeLeft <= 1){
      Haunting_Room? room = mortal.room;
      Haunting_Ghost? ghost = GhostGetter.getGhostByPower(power, power.game);
      if(room != null && ghost != null && ghost.isPlaced == true){
        for(var ghostSpot in room.ghostSpots){
          if(ghostSpot.ghost == null){
            Haunting_GhostSpot? currentGhostSpot = ghost.ghostSpot;
            if(currentGhostSpot != null){
              GhostSpot_Mechanics.removeGhostFromGhostSpot(power.game, currentGhostSpot, powersDeactivation: false);
              GhostSpot_Mechanics.placeGhostAtGhostSpot(ghostSpot, ghost, power.game, room);
            }
            break;
          }
        }
        // GhostSpot_Mechanics.placeGhostAtGhostSpot(ghostSpot, chosenGhost, game, room)
        // GhostSpot_Mechanics.removeGhostFromGhostSpot(game, this);
      }
    }
  }

}