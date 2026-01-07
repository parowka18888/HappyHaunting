import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/PowerScript/PowerType.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseObject_Getter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';

import '../../../../../../../../../../Data/Database/Enums/Power_Targets.dart';
import '../../../../../Haunting_Game.dart';
import '../../../../Room/Haunting_Room.dart';
import '../../../Haunting_Power.dart';
import '../ByType/Damaging/PowersDamaging.dart';
import '../ByType/Effect/PowersEffect.dart';
import '../ByType/Luring/PowersLuring.dart';
import '../ByType/Possessing/PowersPossess.dart';

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
        PowersLuring.usePower_LureMap(power, ghost, room, game, Power_Targets.MortalMap);
        break;
      case PowerType.effectRoom:
        PowersEffect.usePower_EffectRoom(power, ghost, room, game);
        break;
      case PowerType.effectMortal:
        PowersEffect.usePower_EffectMortal(power, ghost, room, game, Power_Targets.MortalSingle);
        break;
      case PowerType.effectMortalRoom:
        PowersEffect.usePower_EffectMortal(power, ghost, room, game, Power_Targets.MortalRoom);
        break;
      case PowerType.effectMortalGlobal:
        PowersEffect.usePower_EffectMortal(power, ghost, room, game, Power_Targets.MortalMap);
        break;
      case PowerType.posessionMortal:
        PowersPossess.usePower_PossessMortal(power, ghost, room, game, Power_Targets.MortalRoom);
        break;
    }
  }
}