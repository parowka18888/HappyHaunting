import 'package:happyhaunting/Data/Database/Enums/PowerType.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Mechanics/UsingPowers/ByType/Damaging/PowersDamaging.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Mechanics/UsingPowers/ByType/Luring/PowersLuring.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';

import '../../../../../../../../../../Data/Database/Enums/Power_Targets.dart';
import '../../../../../../../Haunting_Game.dart';
import '../../../../../../Room/Haunting_Room.dart';

class UsePower_Navigator{
  static void usePower_WithNavigator(Haunting_Power power, Haunting_Ghost ghost, Haunting_Room room, Haunting_Game game){
    PowerType powerType = power.powerType;
    switch (powerType){
      case PowerType.mortalSingle:
        PowersDamaging.usePower_Damage(power, ghost, room, game, Power_Targets.MortalSingle);
        break;
      case PowerType.mortalRoom:
        PowersDamaging.usePower_Damage(power, ghost, room, game, Power_Targets.MortalRoom);
        break;
      case PowerType.mortalGlobal:
        PowersDamaging.usePower_Damage(power, ghost, room, game, Power_Targets.MortalMap);
        break;
      case PowerType.lureFloor:
        PowersLuring.usePower_Lure(power, ghost, room, game, Power_Targets.MortalFloor);
        break;
      case PowerType.lureMap:
        break;
    }
  }
}