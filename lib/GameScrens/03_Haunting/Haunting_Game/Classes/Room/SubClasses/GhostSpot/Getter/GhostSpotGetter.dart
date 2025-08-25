import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Haunting_GhostSpot.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

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