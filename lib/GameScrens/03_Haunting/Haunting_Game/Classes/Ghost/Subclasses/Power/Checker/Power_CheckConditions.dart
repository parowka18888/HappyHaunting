import 'package:happyhaunting/Data/Database/Enums/PowerType.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Getter/GhostGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Mechanics/GhostSpot_Mechanics.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class Power_CheckConditions{
  static void checkPossessionState(Haunting_Power power, Haunting_Game game) {
    if(power.powerType == PowerType.posessionMortal){
      if(power.isActivated == false){
        Haunting_Ghost? ghost = GhostGetter.getGhostByPower(power, game);
        if(ghost != null && ghost.ghostSpot != null){
          GhostSpot_Mechanics.removeGhostFromGhostSpot(game, ghost.ghostSpot!);
        }
      }
    }
  }

}