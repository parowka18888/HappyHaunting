import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Setter/Ghost_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Getter/GhostSpotGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Haunting_GhostSpot.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Mechanics/GhostSpot_Mechanics.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Setter/GhostSpotSetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class TrappedGhost_Mechanics{
  static void freeGhost(Haunting_Ghost ghost, Haunting_Game game) {

    //GET GHOSTSPOT
    Haunting_GhostSpot? ghostSpot = GhostSpotGetter.getGhostSpotByGhost(game, ghost);
    if(ghostSpot != null){
      //IF GHOST IS LOCKED, UNLOCK IT
      //ghost.isUnlocked = true; ///TODO

      //ADDING FREED GHOST TO GHOST LIST
      game.level.ghosts.add(ghost);

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