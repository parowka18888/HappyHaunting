import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../Power/Haunting_Power.dart';

class GhostGetter{
  static Haunting_Ghost? getGhostByPower(Haunting_Power power, Haunting_Game game) {
    for(final ghost in game.level.ghosts + game.level.trappedGhosts){
      for(final ghostPower in ghost.powers){
        if(ghostPower == power){
          return ghost;
        }
      }
    }
    return null;
  }

}