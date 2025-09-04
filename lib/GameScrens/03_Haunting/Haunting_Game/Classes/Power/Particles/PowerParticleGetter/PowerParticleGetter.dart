import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:vector_math/vector_math.dart';

import '../../../GhostSpot/Haunting_GhostSpot.dart';

class PowerParticleGetter{
  static Vector2 getDestination(Haunting_GhostSpot? ghostSpot, Haunting_Mortal mortal) {
    double ghostSpotX = 0;
    double ghostSpotY = 0;
    if(ghostSpot == null){

    } else {
      ghostSpotX = ghostSpot.position.x;
      ghostSpotY = ghostSpot.position.y;
    }
    double x = mortal.absoluteCenter.x - ghostSpotX;
    double y = mortal.absoluteCenter.y - ghostSpotY;
    return Vector2(x, y);
  }

}