import 'package:flame/components.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/GhostSpot/GhostSpot_Type.dart';
import 'package:happyhaunting/Data/Database/Enums/PowerType.dart';
import 'package:happyhaunting/Data/Database/Enums/Power_Targets.dart';
import 'package:happyhaunting/Data/Database/Enums/Tags/Power/05_PowerTag.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Mechanics/GhostSpot_Mechanics.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../../../../../Mortal/Haunting_Mortal.dart';
import '../../../../Particles/PowerParticle.dart';
import '../../../../Particles/PowerParticleGetter/PowerParticleGetter.dart';
import '../../../PowerMechanics.dart';
import '../../Targets/TargetsGetter.dart';

class PowersPossess{
  static void usePower_PossessMortal(Haunting_Power power, Haunting_Ghost ghost, Haunting_Room room, Haunting_Game game, Power_Targets targets) {
    print("USING POSSESS");
    List<Haunting_Mortal> listOfTargets = TargetsGetter.getPowerTargets(targets, room, game);
    if(listOfTargets.isNotEmpty && ghost.ghostSpot!.type == GhostSpot_Type.room){
      listOfTargets.shuffle();
      for(var mortal in listOfTargets){
        if(mortal.isDefeated == false){
          if(mortal.ghostSpot != null && mortal.ghostSpot!.ghost == null){
            print("FOUND GHOST SPOT AT MORTAL ");
            GhostSpot_Mechanics.removeGhostFromGhostSpot(game, ghost.ghostSpot!, powersDeactivation: false);
            GhostSpot_Mechanics.placeGhostAtGhostSpot(mortal.ghostSpot!, ghost, game, room);
            // ghost.powers.firstWhere((power) => power.powerType == PowerType.posessionMortal);
            PowerParticle.travelParticles(Vector2(0, 0), PowerParticleGetter.getDestination(ghost.ghostSpot, mortal), ghost.ghostSpot);
            break;
          }
        }
      }
      PowerMechanics.usePower_EndingProcess(game, power, ghost, room, listOfTargets: listOfTargets);
    }
  }

}