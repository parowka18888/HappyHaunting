import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/SubClasses/Stairs/Hauning_Stairs.dart';

class StairsGetter{
  static Haunting_Stairs? getOppositeStairsByFloor(Haunting_Floor floor, int floorModifier) {
    List<Haunting_Stairs> availableStairs = floor.listStairs;
    int searchedModifier = -1 * floorModifier;

    for(final object in availableStairs){
      if(object.floorModifier == searchedModifier){
        return object;
      }
    }
    return null;
  }

  static Haunting_Stairs? getStairsAtFloor_SearchByModifier(Haunting_Floor floor, int floorModifier) {
    List<Haunting_Stairs> availableStairs = floor.listStairs;
    for(final object in availableStairs){
      if(object.floorModifier == floorModifier){
        return object;
      }
    }
    return null;
  }

}