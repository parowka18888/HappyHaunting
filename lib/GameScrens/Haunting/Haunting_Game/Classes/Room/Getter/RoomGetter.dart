import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

class RoomGetter{

  static Haunting_Room? getRoomByName(String name, Haunting_Game game) {
    for(final room in game.level.rooms){
      if(room.id == name){
        print("ZNALEZIONO ROOM!");
        return room;
      }
    }
    print("ROOM NOT FOUND!");
    return null;

  }

}