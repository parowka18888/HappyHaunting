import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Setter/Ghost_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../../GhostSpot/Getter/GhostSpotGetter.dart';
import '../../../../GhostSpot/Haunting_GhostSpot.dart';
import '../../../../GhostSpot/Mechanics/GhostSpot_Mechanics.dart';

class TrappedGhost_Mechanics{
  static void freeGhost(Haunting_Ghost ghost, Haunting_Game game) {

    //GET GHOSTSPOT
    Haunting_GhostSpot? ghostSpot = GhostSpotGetter.getGhostSpotByGhost(game, ghost);
    if(ghostSpot != null){
      //IF GHOST IS LOCKED, UNLOCK IT
      //ghost.isUnlocked = true; ///TODO

      //ADDING FREED GHOST TO GHOST LIST
      game.level.ghosts.add(ghost);

      //SETTING GHOST ISFREEVALUE
      Ghost_Setter.setIsFree(ghost, true);

      //CLEARING GHOSTSPOT
      GhostSpot_Mechanics.removeGhostFromGhostSpot(game, ghostSpot);


      //REMOVING GHOST SPOT
      // ghostSpot.removeFromParent();
      Future.delayed(const Duration(milliseconds: 600), () { ///TODO FIX TIME, WHEN CHANGING PARTICLES
        ghostSpot.removeFromParent();
      });

      //SHOWING DIALOG WINDOW
      game.viewModel.setDialogData(ghost.freeingText, true);

      //SETTING SCRIPT AS EXECUTED
      Ghost_Setter.setIsScriptExecuted(ghost, true);
    }
  }

}