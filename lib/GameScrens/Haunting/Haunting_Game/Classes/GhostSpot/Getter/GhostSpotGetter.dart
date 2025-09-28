import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

import '../Haunting_GhostSpot.dart';

class GhostSpotGetter{
  static Haunting_GhostSpot? getGhostSpotByGhost(Haunting_Game game, Haunting_Ghost chosenGhost) {
    for(var ghostSpot in game.level.ghostSpots){
      if(ghostSpot.ghost == chosenGhost){
        return ghostSpot;
      }
    }
    return null;
  }

}