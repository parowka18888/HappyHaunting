import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/GhostScript/GhostScript.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Scripts/LevelScripts/ScriptsByLevel/TestLevel/Scripts_TestLevel_Ghost.dart';

import '../../../Haunting_Game.dart';

class Scripts_GhostBased{
  static void getScript_Navigator(Haunting_Ghost ghost, Haunting_Game game) {
    switch (ghost.script){
      case null:
        break;
      case GhostScript.testScript_FreeingGhost:
        Scripts_TestLevel_Ghost.executeScript_testScript_FreeingGhost(ghost, game);
        break;
    }
  }
}