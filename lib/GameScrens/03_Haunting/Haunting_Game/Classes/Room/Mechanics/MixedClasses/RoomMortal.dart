import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../Mortal/Mechanics/Getter/MortalGetter.dart';
import '../../../Mortal/Mechanics/Setter/Mortal_Setter.dart';

class RoomMortal{
  // static void assignMortalToRoom(Haunting_Mortal mortal, Haunting_Game game) {
  //   List<Haunting_Room> rooms = game.level.rooms;
  //   for(Haunting_Room room in rooms){
  //       final isInside = room.containsPoint(mortal.position);
  //       final alreadyInside = room.mortalsInRoom.contains(mortal);
  //       if (isInside && !alreadyInside) {
  //         room.mortalsInRoom.add(mortal);
  //         Mortal_Setter.setRoom(mortal, room);
  //         if(mortal.name == "Haunting_Ogórki")
  //         print("👻 Mortal ${mortal.name} wchodzi do pokoju ${room.id} at ${DateTime.now()}");
  //       }
  //       // else if (!isInside && alreadyInside) {
  //       //   room.mortalsInRoom.remove(mortal);
  //       //   if(mortal.name == "Haunting_Ogórki")
  //       //   print("❌ Mortal ${mortal.name} wychodzi z pokoju ${room.id} at ${DateTime.now()}");
  //       // }
  //   }
  // }
  static void assignMortalToRoom(Haunting_Mortal mortal, Haunting_Game game) {
    List<Haunting_Room> rooms = game.level.rooms;
    for(Haunting_Room room in rooms){
      final isInside = room.containsPoint(mortal.absoluteCenter);
      final alreadyInside = room.mortalsInRoom.contains(mortal);
      if (isInside && !alreadyInside) {
        room.mortalsInRoom.add(mortal);
        if(mortal.ghostSpot != null && mortal.ghostSpot!.ghost != null){
          mortal.ghostSpot!.ghost!.room = room;
        }
        // print("👻 Mortal ${mortal.name} wchodzi do pokoju ${room.id} at ${DateTime.now()}");
      } else if (!isInside && alreadyInside) {
        room.mortalsInRoom.remove(mortal);
        // print("❌ Mortal ${mortal.name} wychodzi z pokoju ${room.id} at ${DateTime.now()}");
      }
    }
  }

}