import 'package:happyhaunting/Data/Database/Enums/PowerType.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Getter/GhostGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Getter/RoomGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../Entry/Haunting_Entry.dart';
import '../../Mortal/Haunting_Mortal.dart';
import '../../UsedPowers/Mechanics/UsedPowers_ManagingObjects.dart';
import '../Haunting_Power.dart';
import 'UsingPowers/Navigator/UsePower_Navigator.dart';

class PowerMechanics{

  static void usePower(Haunting_Power power, Haunting_Game game) {
    if(power.isActivated == true && power.currentCooldown <= 0){
      Haunting_Ghost? owningGhost = GhostGetter.getGhostByPower(power, game);
      if(owningGhost != null){
        Haunting_Room? owningRoom = owningGhost.room;
        if(owningRoom != null){
          UsePower_Navigator.usePower_WithNavigator(power, owningGhost, owningRoom, game);
        }
      }
    }
  }

  static void setPowerCooldown(Haunting_Power power, Haunting_Game game) {
    power.currentCooldown = power.cooldown;
    print("użyto umiejętności ${power.name}!");
    // game.viewModel.refresh();
  }

  static void usePower_EndingProcess(Haunting_Game game, Haunting_Power power, Haunting_Ghost ghost, Haunting_Room room, {
    List<Haunting_Mortal>? listOfTargets
  }) {
    PowerMechanics.setPowerCooldown(power, game);
    UsedPowers_ManagingObjects.addUsedPower(game, power, ghost, room);

    if(listOfTargets != null){
      Haunting_Entry.addEntry_GhostUsesPower_Targets(game.viewModel, ghost, listOfTargets, power);
    } else {
      Haunting_Entry.addEntry_UsesPower(game.viewModel, ghost, power);
    }
  }


}