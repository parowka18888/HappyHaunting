import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/GhostSpot/Haunting_GhostSpot.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/ViewModels/Haunting/HauntingGame_ViewModel.dart';

class Exorcism_Mechanics{
  static void exorcismNavigator(Haunting_Mortal mortal, Haunting_Game game, double modifier, HauntingGame_ViewModel viewModel) {
    Haunting_Room? room = mortal.room;
    bool isDamageDealt = false;

    if(room != null){
      List<Haunting_GhostSpot> listOfGhostSpots = room.ghostSpots;
      List<Haunting_Mortal> listOfMortals = room.mortalsInRoom;

      //DEALING DAMAGE TO GHOSTS IN GHOST SPOTS
      for(var ghostSpot in listOfGhostSpots){
        if(ghostSpot.ghost!= null && ghostSpot.ghost!.isDefeatable == true){
          isDamageDealt = banishGhost(mortal, modifier, viewModel, ghostSpot);
        }
      }
      //DEALING DAMAGE TO GHOSTS IN POSSESSION
      for(var mortalInRoom in listOfMortals){
        if(mortalInRoom.ghostSpot != null && mortalInRoom.ghostSpot!.ghost != null){
          if(mortal.id != mortalInRoom.id){
            isDamageDealt = banishGhost(mortal, modifier, viewModel, mortalInRoom.ghostSpot!);
          }
        }
      }
      if(isDamageDealt) {
        game.viewModel.refresh();
      }
    }
  }

  static bool banishGhost(Haunting_Mortal mortal, double modifier, HauntingGame_ViewModel viewModel, Haunting_GhostSpot ghostSpot) {
    Haunting_Ghost ghost = ghostSpot.ghost!;
    ghost.health_Current -= mortal.exorcismStrength * modifier;
    return true;
  }

}