import 'package:flame/components.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Setter/LevelSetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Getter/MortalGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Navigator.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Getter/InteractiveObject_Getter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Haunting_InteractiveObject.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Setter/InteractiveObject_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../../Classes/Astar/AStar_Grid.dart';
import '../../../CheckConditions/Script_CheckConditions.dart';

class Scripts_TestLevel {
  static void executeScript_testScript_Level(Haunting_Game game) {

    var level = game.level;

    //CONDITION TO MEET
    List<List<int>> conditions = [
      [0]
    ];

    //CHECK IF CONDITIONS ARE MET
    bool conditionsAreMet = Script_CheckConditions.checkIfConditionsAreMet(conditions, level.conditionsMet);
    if(conditionsAreMet){
      LevelSetter.setIsScriptExecuted(level, true);
    }

    //OPENING THE CLOSED DOOR TO THE SHED [0]
    if(!level.conditionsMet.contains(0)){
      Haunting_InteractiveObject? object = InteractiveObject_Getter.getInteractiveObject_ById("TestClosedDoor", game);
      if(object?.isInUse == true){
        if(object!.timeOfUse >= 4){
          Haunting_Mortal? mortal = MortalGetter.getMortalByVector(game, object.position);
          InteractiveObject_Setter.setIsActive(object, false);
          Haunting_Floor? floor = object.floor;
          if(floor != null){
            level.listOfIgnoredCollisions_ID.add(332);
            AStar_Grid.getWalkableGrid(level);
            floor.mortalActionPoints.addAll([
              Vector2(1124, 252),
              Vector2(1172, 192),
              Vector2(1276, 244),
            ]);
            level.conditionsMet.add(0);
            if(mortal!= null){
              Mortal_Destination_Navigator.setMortalNextDestination_Navigator(mortal, game, destinationPoint: Vector2(1124, 252));
            }
            print("OTWARTO DROGĘ!");
          }
        }
      }
    }
  }

}