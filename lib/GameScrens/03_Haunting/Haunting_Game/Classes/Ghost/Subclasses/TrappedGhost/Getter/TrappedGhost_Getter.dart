import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class TrappedGhost_Getter{
  static getTrappedGhost_ByID(String ghostID, Haunting_Game game) {
    for(var ghost in game.trappedGhosts){
      if(ghost.id == ghostID){
        return ghost;
      }
    }
    return null;
  }

}