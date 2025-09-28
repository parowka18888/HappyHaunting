import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/LevelScript/LevelScript.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Scripts/LevelScripts/ScriptsByLevel/TestLevel/Scripts_TestLevel.dart';

import '../../../Haunting_Game.dart';

class Scripts_LevelBased{
  static void getScript_Navigator(Haunting_Game game) {
    switch (game.level.script){
      case null:
        break;
      case LevelScript.empty:
        break;
      case LevelScript.testScript_Level:
        Scripts_TestLevel.executeScript_testScript_Level(game);
        break;
    }
  }
}