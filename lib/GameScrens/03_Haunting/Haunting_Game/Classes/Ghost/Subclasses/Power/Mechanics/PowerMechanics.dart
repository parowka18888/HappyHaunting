import 'package:happyhaunting/Data/Database/Enums/PowerType.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Getter/GhostGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Mechanics/UsingPowers/Navigator/UsePower_Navigator.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Getter/RoomGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Getter/GhostSpotGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Haunting_GhostSpot.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Particle/GhostSpot_Particle.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

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
    game.viewModel.refresh();
  }

}