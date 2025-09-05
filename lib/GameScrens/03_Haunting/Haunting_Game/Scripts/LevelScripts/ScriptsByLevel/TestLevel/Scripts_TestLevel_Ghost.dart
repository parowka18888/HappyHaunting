import 'package:happyhaunting/Data/Database/Enums/Tags/Power/05_PowerTag.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/TrappedGhost/Mechanics/TrappedGhost_Mechanics.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Getter/FloorGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Getter/RoomGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Getter/InteractiveObject_Getter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Haunting_InteractiveObject.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Scripts/CheckConditions/Script_CheckConditions.dart';

class Scripts_TestLevel_Ghost{

  static void executeScript_testScript_FreeingGhost(Haunting_Ghost ghost, Haunting_Game game) {

    //CONDITION TO MEET
    List<List<int>> conditions = [
      [0],  // THERE ARE TWO WAYS OF FREEING THIS GHOST, BOTH NEED ONLY ONE CONDITION
    ];

    //CHECK IF CONDITIONS ARE MET
    bool conditionsAreMet = Script_CheckConditions.checkIfConditionsAreMet(conditions, ghost.conditionsMet);
    if(conditionsAreMet){
      TrappedGhost_Mechanics.freeGhost(ghost, game);
    }

    //USE LOUD POWER IN ROOM [0]
    if(!ghost.conditionsMet.contains(0)){
      // print("SPRAWDZAM CZY WYKONANE 0");
      for(var usedPower in game.level.usedPowers){
        if(ghost.room != null){
          if(usedPower.room.id == ghost.room!.id){
            if(usedPower.power.powerTags.contains(PowerTag.Loud)){
              //CONDITION MET
              ghost.conditionsMet.add(0);
              break;
            }
          }
        }
      }
    }

    //MORTAL CAN FREE IT BY USING SPECIAL OBJECT [1]
    if(!ghost.conditionsMet.contains(1)){
      // print("SPRAWDZAM CZY WYKONANE 1");
      Haunting_Floor? floor = FloorGetter.getFloorById(0, game);
      if(floor != null){
        Haunting_InteractiveObject? object = InteractiveObject_Getter.getInteractiveObject_ById("TrappedGhost_Jar", game, floor: floor);
        if(object != null){
          //IF OBJECT IS FOUND, CHECK IF MORTAL USES IT FOR 3 SECONDS
          if(object.timeOfUse >= 4){
            ghost.conditionsMet.add(1);
            object.canBeUsed = false;
          }
        }
      }
    }

  }

}