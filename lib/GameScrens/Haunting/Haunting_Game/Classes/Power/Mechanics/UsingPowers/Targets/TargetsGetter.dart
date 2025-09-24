import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';

import '../../../../../../../../../../Data/Database/Enums/Power_Targets.dart';
import '../../../../../Haunting_Game.dart';
import '../../../../Mortal/Mechanics/CheckConditions/MortalChecker.dart';
import '../../../../Room/Haunting_Room.dart';

class TargetsGetter{
  static List<Haunting_Mortal> getPowerTargets(Power_Targets targets, Haunting_Room room, Haunting_Game game) {
    List<Haunting_Mortal> listOfAvailableMortals = [];
    List<Haunting_Mortal> listOfTargets = [];
    Haunting_Floor? floor = room.floor;
    switch(targets){
      case Power_Targets.MortalSingle:
        listOfAvailableMortals = getAvailableMortalsForList(room.mortalsInRoom);
        if(listOfAvailableMortals.isNotEmpty){
          listOfAvailableMortals.shuffle();
          listOfTargets.add(listOfAvailableMortals[0]);
        }
        break;
      case Power_Targets.MortalRoom:
        listOfAvailableMortals = getAvailableMortalsForList(room.mortalsInRoom);
        if(listOfAvailableMortals.isNotEmpty){
          listOfTargets = listOfAvailableMortals;
        }
        break;
      case Power_Targets.MortalMap:
        listOfAvailableMortals = getAvailableMortalsForList(game.level.mortals);
        if(listOfAvailableMortals.isNotEmpty){
          listOfTargets = listOfAvailableMortals;
        }
        break;
      case Power_Targets.MortalFloor:
        listOfAvailableMortals = getAvailableMortalsForList(game.level.mortals);
        if(floor != null && listOfAvailableMortals.isNotEmpty){
          for(final mortal in listOfAvailableMortals){
              if(mortal.floor?.id == floor.id){
                listOfTargets.add(mortal);
              }
          }
        }
        break;
    }
    return listOfTargets;
  }

  static List<Haunting_Mortal> getAvailableMortalsForList(List<Haunting_Mortal> list) {
    return  list.where((mortal) => MortalChecker.checkIfMortalIsTargetable(mortal))
        .toList();
    // List<Haunting_Mortal> availableMortals = [];
    // for(var mortal in list){
    //   bool isTargetable = MortalChecker.checkIfMortalIsTargetable(mortal);
    //   if(isTargetable == true){
    //     availableMortals.add(mortal);
    //   }
    // }
    // return availableMortals;
    // return  list.where((mortal) => mortal.isActive && mortal.ghostSpot != null && mortal.ghostSpot!.ghost == null)
    //     .toList();
  }

}