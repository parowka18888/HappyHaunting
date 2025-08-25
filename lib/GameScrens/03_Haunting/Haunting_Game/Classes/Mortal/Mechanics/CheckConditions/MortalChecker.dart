import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Mechanics/MixedClasses/RoomMortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Setter/RoomSetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class MortalChecker{
  // static void checkIfMortalIsInCorrectRoom(Haunting_Mortal mortal, Haunting_Game game) {
  //
  //   if(mortal.room != null){
  //     if(mortal.room!.containsPoint(mortal.position)){
  //       //STILL IN THE ROOM
  //       if(mortal.name == "Haunting_Ogórki")
  //         print("👻 Mortal ${mortal.name} JEST DALEJ W POKOJU ${mortal.room!.id} at ${DateTime.now()}");
  //       return;
  //     } else {
  //       //OUT OF THE ROOM
  //       RoomSetter.removeMortalFromMortalsInRoom(mortal.room!, mortal);
  //       Mortal_Setter.setRoom(mortal, null);
  //     }
  //   }
  //   RoomMortal.assignMortalToRoom(mortal, game);
  //   // Mortal_Setter.setCurrentRoom(mortal, game);
  // }

}