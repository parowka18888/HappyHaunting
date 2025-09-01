import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class FloorGetter{
  static Haunting_Floor? getFloorById(int id, Haunting_Game game) {
    for(final floor in game.level.floors){
      if(floor.id == id){
        return floor;
      }
    }
    return null;
  }

  static Haunting_Floor? getFloorByRoom(Haunting_Room room, Haunting_Game game) {
    return room.floor;
  }

}