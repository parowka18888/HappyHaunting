import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Level/Haunting_Level.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/ViewModels/Haunting/HauntingGame_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../../../../GlobalCode/Navigator/AppNavigator.dart';
import '../../../../../../MainMenu/MainMenu.dart';

class EndGameMechanics{
  
  static void endGameProcess(Haunting_Game game) {
    Haunting_Level level = game.level;
    level.isReadyToQuit = true;
    
    //ODBLOKOWANIE DUCHÓW
    unlockTrappedGhosts(game);

    //USTANOWIENIE REKORDU

    //DODAWANIE ZASOBÓW
    
    //WYŚWIETLENIE KOMUNIKATU
    game.viewModel.setDialogData(game.level_Database!.endingText, true);
  }

  static void unlockTrappedGhosts(Haunting_Game game) {
    for(Ghost ghost in game.trappedGhosts){
      for(Haunting_Ghost hauntingGhost in game.level.trappedGhosts){
        if(ghost.id == hauntingGhost.id){
          if(ghost.isUnlocked == false){
            if(hauntingGhost.isFree == true){
              ghost.isUnlocked = true;
              ghost.save();
            }
          }
          break;
        }
      }
    }
  }

  static void endGame(BuildContext context) {
    HauntingGame_ViewModel viewModel = context.watch<HauntingGame_ViewModel>();

    if(viewModel.game != null && viewModel.game!.level.isReadyToQuit){
      AppNavigator.navigateToMainMenu(context, MainMenu());
    }
  }
  
}