import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/GhostScript/GhostScript.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Scripts/LevelScripts/ScriptsByLevel/EP0_1_Scripts/EP0_1_Scripts.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Scripts/LevelScripts/ScriptsByLevel/TestLevel/Scripts_TestLevel_Ghost.dart';

import '../../../Haunting_Game.dart';

class Scripts_GhostBased{
  static void getScript_Navigator(Haunting_Ghost ghost, Haunting_Game game) {
    switch (ghost.script){
      case null:
        break;
      case GhostScript.testScript_FreeingGhost:
        Scripts_TestLevel_Ghost.executeScript_testScript_FreeingGhost(ghost, game);
        break;
      case GhostScript.script_FreeGhost_ClothesEater:
        {
          EP0_1_Scripts.executeScript_FreeClothesEater(ghost, game);
          break;
        }

    }
  }
}