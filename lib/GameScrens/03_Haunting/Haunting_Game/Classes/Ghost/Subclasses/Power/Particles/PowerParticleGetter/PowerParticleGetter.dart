import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Haunting_GhostSpot.dart';
import 'package:vector_math/vector_math.dart';

class PowerParticleGetter{
  static Vector2 getDestination(Haunting_GhostSpot? ghostSpot, Haunting_Mortal mortal) {
    double x = mortal.absoluteCenter.x - ghostSpot!.position.x;
    double y = mortal.absoluteCenter.y - ghostSpot.position.y;
    return Vector2(x, y);
  }

}