import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/CheckConditions/MortalChecker.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class Scripts_TestLevel_Mortal{
  static void executeScript_testScript_SpawnWhenOneMortalIsDefeated(Haunting_Mortal mortal, Haunting_Game game) {
    print("SJRYPT ${mortal.script} dla mortala ${mortal.name}");

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

}