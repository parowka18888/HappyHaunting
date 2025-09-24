import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/LevelScript/LevelScript.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Scripts/LevelScripts/ScriptsByLevel/TestLevel/Scripts_TestLevel_Mortal.dart';

import '../../../../../../Data/Database/Enums/Haunting/Scripts/MortalScript/MortalScript.dart';

class Scripts_MortalBased{

  static void getScript_Navigator(Haunting_Mortal mortal, Haunting_Game game) {

    switch (mortal.script){
      case null:
        break;
      case MortalScript.testScript_SpawnWhenOneMortalIsDefeated:
        Scripts_TestLevel_Mortal.executeScript_testScript_SpawnWhenOneMortalIsDefeated(mortal, game);
        break;
      case MortalScript.testScript_SpawnBM_TestLevel:
        Scripts_TestLevel_Mortal.executeScript_testScript_SpawnBM_TestLevel(mortal, game);
        break;
    }
  }

}