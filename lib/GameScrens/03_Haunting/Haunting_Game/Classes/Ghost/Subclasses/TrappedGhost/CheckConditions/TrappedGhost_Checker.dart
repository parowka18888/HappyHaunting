import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class TrappedGhost_Checker{
  static bool checkIfThereIsGhostToFree(Haunting_Game? game) {
    if(game != null){
        for(var trappedGhost in game.level.trappedGhosts){
          if(trappedGhost.isFree == false) return true;
        }
    }
    return false;
  }

}