import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/GhostSpot/Haunting_GhostSpot.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class Exorcism_Mechanics{
  static void exorcismNavigator(Haunting_Mortal mortal, Haunting_Game game, double modifier) {
    Haunting_Room? room = mortal.room;
    bool isDamageDealt = false;

    if(room != null){
      List<Haunting_GhostSpot> listOfGhostSpots = room.ghostSpots;
      List<Haunting_Mortal> listOfMortals = room.mortalsInRoom;

      //DEALING DAMAGE TO GHOSTS IN GHOST SPOTS
      for(var ghostSpot in listOfGhostSpots){
        if(ghostSpot.ghost!= null && ghostSpot.ghost!.isDefeatable == true){
          ghostSpot.ghost!.health_Current -= mortal.exorcismStrength * modifier;
          isDamageDealt = true;
        }
      }
      //DEALING DAMAGE TO GHOSTS IN POSSESSION
      for(var mortalInRoom in listOfMortals){
        if(mortalInRoom.ghostSpot != null && mortalInRoom.ghostSpot!.ghost != null){
          if(mortal.id != mortalInRoom.id){
            mortalInRoom.ghostSpot!.ghost!.health_Current -= mortal.exorcismStrength * modifier ;
            isDamageDealt = true;
          }
        }
      }
      if(isDamageDealt) {
        game.viewModel.refresh();
      }
    }
  }

}