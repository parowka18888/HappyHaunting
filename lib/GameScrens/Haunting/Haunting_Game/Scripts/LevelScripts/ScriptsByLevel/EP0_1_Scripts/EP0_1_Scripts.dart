import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../../../../../Data/Database/Enums/Tags/Power/05_PowerTag.dart';
import '../../../../Classes/Ghost/Subclasses/TrappedGhost/Mechanics/TrappedGhost_Mechanics.dart';
import '../../../../Classes/Mortal/Mechanics/CheckConditions/MortalChecker.dart';
import '../../../../Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';
import '../../../CheckConditions/Script_CheckConditions.dart';

class EP0_1_Scripts {

  static void executeScript_FreeClothesEater(Haunting_Ghost ghost, Haunting_Game game) {
    //CONDITION TO MEET
    List<List<int>> conditions = [
      [0], // THERE IS ONE WAY OF FREEING THIS GHOST - CONDITION NEEDS ONLY ONE STEP
    ];

    //CHECK IF CONDITIONS ARE MET
    bool conditionsAreMet = Script_CheckConditions.checkIfConditionsAreMet(conditions, ghost.conditionsMet);
    if(conditionsAreMet){
      TrappedGhost_Mechanics.freeGhost(ghost, game);
    }

    //USE [WIND, DECTRUCIVE, MOVE] POWER IN ROOM [0]
    if(!ghost.conditionsMet.contains(0)){
      for(var usedPower in game.level.usedPowers){
        if(ghost.room != null){
          if(usedPower.room.id == ghost.room!.id){
            if(usedPower.power.powerTags.contains(PowerTag.wind)){
              ghost.conditionsMet.add(0);
              break;
            }
          }
        }
      }
    }
  }

  static void executeScript_SummonExorcis(Haunting_Mortal mortal, Haunting_Game game) {
    String text = "EP0_1_SummonedExorcist";
    //  0 ->  3 OF MORTALS HAS ESCAPED

    List<int> conditionsToMeet = [0];
    int escapedMortals = 0;
    for(var checkingMortal in game.level.mortals){
      bool condition = MortalChecker.checkIfMortalEscaped(checkingMortal);
      if(condition){
        escapedMortals++;
      }
      if(escapedMortals >= 3){
        Mortal_Setter.setIsActive(mortal, true);
        Mortal_Setter.setIsScriptExecuted(mortal, true);
        game.viewModel.setDialogData(text, true);
        break;
      }
    }
  }

}