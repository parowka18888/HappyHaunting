import 'package:happyhaunting/Data/Database/Enums/Mortal_DefeatType.dart';
import 'package:happyhaunting/Data/Database/Enums/Mortal_State.dart';
import 'package:happyhaunting/Data/Database/Enums/Tags/Mortal/06_MortalTag.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Exit/Haunting_Exit.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Navigator.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Mechanics/MixedClasses/RoomMortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Setter/RoomSetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class MortalChecker{

  static void checkIfMortalIsDefeated(Haunting_Mortal mortal, Haunting_Game game) {

    checkForMortalState(mortal, game);

    if(mortal.stat_Current_Fear > mortal.stat_Fear){
      mortal.isDefeated = true; mortal.defeatType = Mortal_DefeatType.Fear;
    } else if (mortal.stat_Current_Madness > mortal.stat_Madness){
      mortal.isDefeated = true; mortal.defeatType = Mortal_DefeatType.Madness;
    } else if (mortal.stat_Current_Faith > mortal.stat_Faith){
      mortal.isDefeated = true; mortal.defeatType = Mortal_DefeatType.Faith;
    } else if (mortal.stat_Current_Health > mortal.stat_Health){
      mortal.isDefeated = true; mortal.defeatType = Mortal_DefeatType.Health;
    }

    if(mortal.isDefeated == true){
      List<Haunting_Exit> exitPoints = game.level.exitPoints;
      if(exitPoints.isNotEmpty){
        exitPoints.shuffle();
        Haunting_Exit exitPoint = exitPoints[0];
        Mortal_Setter.setFinalData(mortal, exitPoint.position, exitPoint.floor);
        print(exitPoint.position);
        Mortal_Destination_Navigator.setMortalNextDestination_Navigator(mortal, game);
        print("MORTAL ${mortal.name} UCIEKA!");
      }
    }
    return;
  }

  static void checkForMortalState(Haunting_Mortal mortal, Haunting_Game game) {

    //PERCENTAGES OF CHANGE OF STATE
    var percentageChange_Scared = 0.35;
    var percentageChange_Terrified = 0.75;

    if(mortal.stat_Current_Fear >= mortal.stat_Fear * percentageChange_Scared){
      Mortal_Setter.setState(mortal, Mortal_State.scared);
      if(mortal.stat_Current_Fear >= mortal.stat_Fear * percentageChange_Terrified){
        Mortal_Setter.setState(mortal, Mortal_State.terrified);
      }
    } else {
      Mortal_Setter.setState(mortal, Mortal_State.calm);
    }
  }

  static bool checkIfMortalEscaped(Haunting_Mortal mortal) {
    if(mortal.isDefeated == true && mortal.isEscaped == true){
      return true;
    }
    return false;
  }

  static bool checkIfMortalIsTargetable(Haunting_Mortal mortal) {
    if(mortal.isActive == true && mortal.ghostSpot != null && mortal.ghostSpot!.ghost == null){
      return true;
    } else {
      return false;
    }
  }

  static bool checkIfMortalIsExorcist(Haunting_Mortal mortal) {
    if(mortal.tags.contains(MortalTag.exorcist)){
      return true;
    }
    return false;
  }

  static bool checkIfMortalIsCloseToTheStairs(Haunting_Mortal mortal, Haunting_Game game) {
    for(final floor in game.level.floors){
      for(final stairsPoint in floor.listStairs){
        var stairsCenter = stairsPoint.absoluteCenter;
        var mortalCenter = mortal.absoluteCenter;
        double distance = mortal.size.x * 1;
        if(
        (mortalCenter.x - stairsCenter.x).abs() < distance
        &&  (mortalCenter.y - stairsCenter.y).abs() < distance
        ){
          return true;
        }
      }
    }
    return false;
  }

}