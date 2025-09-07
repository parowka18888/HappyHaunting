import 'package:flame/components.dart';
import 'package:happyhaunting/Data/Database/Enums/Power_Targets.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Behavior/Mortal_Behavior_Checker.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/UsedPowers/Mechanics/UsedPowers_ManagingObjects.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../../Haunting_Power.dart';
import '../../../../Particles/PowerParticle.dart';
import '../../../../Particles/PowerParticleGetter/PowerParticleGetter.dart';
import '../../../DealingDamage/DealingDamage.dart';
import '../../../PowerMechanics.dart';
import '../../Targets/TargetsGetter.dart';

class PowersDamaging{
  static void usePower_Damage(Haunting_Power power, Haunting_Ghost ghost, Haunting_Room room, Haunting_Game game, Power_Targets targets){
      List<Haunting_Mortal> listOfTargets = TargetsGetter.getPowerTargets(targets, room, game);
      if(listOfTargets.isNotEmpty){
        for(var mortal in listOfTargets){
          if(mortal.isDefeated == false){
            DealingDamage.dealInstantDamageToMortal(power, mortal, game);
            PowerParticle.travelParticles(Vector2(0, 0), PowerParticleGetter.getDestination(ghost.ghostSpot, mortal), ghost.ghostSpot);
            Mortal_Behavior_Checker.checkIfMortalShouldBeFreeFromAction(mortal, power);
          }
        }
        PowerMechanics.usePower_EndingProcess(game, power, ghost, room, listOfTargets: listOfTargets);
      }
  }
}