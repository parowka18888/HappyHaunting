import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

class HauntingLevel_CheckConditions{

  static bool checkIfAllMortalsAreEscaped(Haunting_Game game) {
    List<Haunting_Mortal> allMortals = game.level.mortals;
    for(final mortal in allMortals){
      if(mortal.isActive == true){
        if(mortal.isDefeated != true || mortal.isEscaped != true){
          return false;
        }
      }
    }
    return true;
  }

}