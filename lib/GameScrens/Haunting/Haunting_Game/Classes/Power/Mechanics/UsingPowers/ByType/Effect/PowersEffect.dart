
import 'package:flame/components.dart';
import 'package:happyhaunting/Data/Database/Enums/Power_Targets.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Mechanics/UsingPowers/Targets/TargetsGetter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../../../Effect/Room/Haunting_Effect.dart';
import '../../../../Haunting_Power.dart';
import '../../../../Particles/PowerParticle.dart';
import '../../../../Particles/PowerParticleGetter/PowerParticleGetter.dart';
import '../../../PowerMechanics.dart';

class PowersEffect{

  static void usePower_EffectRoom(Haunting_Power power, Haunting_Ghost ghost, Haunting_Room room, Haunting_Game game) {
    Haunting_Effect? effect;
    for(var roomEffect in room.effects){
      if(roomEffect.power == null){
        effect = roomEffect;
        break;
      } else {
        print(roomEffect.power!.icon);
      }
    }
    if(effect != null){
      effect.power = power;
      effect.timeLeft = power.powerTime;
      PowerParticle.globalPower(Vector2(0, 0), ghost.ghostSpot!);
      PowerMechanics.usePower_EndingProcess(game, power, ghost, room);
    }
  }

  static void usePower_EffectMortal(Haunting_Power power, Haunting_Ghost ghost, Haunting_Room room, Haunting_Game game, Power_Targets targets) {
    List<Haunting_Mortal> listOfTargets = TargetsGetter.getPowerTargets(targets, room, game);
    if(listOfTargets.isNotEmpty){
      for(var mortal in listOfTargets){
        if(mortal.isDefeated == false){
          Haunting_MortalEffect effect = Haunting_MortalEffect(power: power, mortal: mortal);
          game.add(effect);
          mortal.effects.add(effect);
          PowerParticle.travelParticles(Vector2(0, 0), PowerParticleGetter.getDestination(ghost.ghostSpot, mortal), ghost.ghostSpot);
          PowerMechanics.usePower_EndingProcess(game, power, ghost, room, listOfTargets: listOfTargets);
        }
      }
    }
  }

}