import 'package:flame/components.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Haunting_GhostSpot.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../Mechanics/MixedClasses/RoomGhost.dart';

class GhostSpot_Mechanics{
  static void removeGhostFromGhostSpot(Haunting_Game game, Haunting_GhostSpot ghostSpot) {
    Vector2 ghostSpot_ParticlePosition = Vector2(0 + ghostSpot.size.x / 2, 0 + ghostSpot.size.y / 2);
    print(ghostSpot_ParticlePosition);
    RoomGhost.clearSpotFromGhost(game, ghostSpot, ghostSpot_ParticlePosition);
  }

}