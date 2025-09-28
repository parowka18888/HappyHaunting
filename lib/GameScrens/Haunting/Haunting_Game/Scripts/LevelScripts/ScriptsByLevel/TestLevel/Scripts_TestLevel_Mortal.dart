import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Getter/GhostGetter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/CheckConditions/MortalChecker.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../CheckConditions/Script_CheckConditions.dart';

class Scripts_TestLevel_Mortal{
  static void executeScript_testScript_SpawnWhenOneMortalIsDefeated(Haunting_Mortal mortal, Haunting_Game game) {
    // print("SJRYPT ${mortal.script} dla mortala ${mortal.name}");

    String text = "New mortal Appeared - Marej";

    List<int> conditionsToMeet = [0];
    //  0 ->  ONE OF MORTALS HAS ESCAPED
    for(var checkingMortal in game.level.mortals){
      bool condition = MortalChecker.checkIfMortalEscaped(checkingMortal);
      if(condition){
        Mortal_Setter.setIsActive(mortal, true);
        Mortal_Setter.setIsScriptExecuted(mortal, true);
        game.viewModel.setDialogData(text, true);
        break;
      }
    }
  }

  static void executeScript_testScript_SpawnBM_TestLevel(Haunting_Mortal mortal, Haunting_Game game) {
    //CONDITION TO MEET
    List<List<int>> conditions = [
      [0, 1] // THERE ARE TWO WAYS OF FREEING THIS GHOST, BOTH NEED ONLY ONE CONDITION
    ];
    String text = "New mortal Appeared - BM";

    print("SPRAWDZAM BM -> ${conditions} ; ${mortal.conditionsMet}");
    //CHECK IF CONDITIONS ARE MET
    bool conditionsAreMet = Script_CheckConditions.checkIfConditionsAreMet(conditions, mortal.conditionsMet);
    if(conditionsAreMet){
      Mortal_Setter.setIsActive(mortal, true);
      Mortal_Setter.setIsScriptExecuted(mortal, true);
      game.viewModel.setDialogData(text, true);
    }

    //ONE MORTAL IS DEFEATED AND ESCAPED [0]
    if(!mortal.conditionsMet.contains(0)){
      for(var checkingMortal in game.level.mortals){
        bool condition = MortalChecker.checkIfMortalEscaped(checkingMortal);
        if(condition){
          mortal.conditionsMet.add(0);
          break;
        }
      }
    }

    //TRAPPED GHOST IS FREED [1]
    if(!mortal.conditionsMet.contains(1)){
      Haunting_Ghost? trappedGhost = GhostGetter.getGhostByID("EP0_ClothesEater", game, isTrapped: true, isFree: false);
      if(trappedGhost != null){
        print("TU ${trappedGhost.isScriptExecuted}");
        if(trappedGhost.isScriptExecuted == true){
          mortal.conditionsMet.add(1);
        }
      }
    }
    

  }

}