import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:vector_math/vector_math.dart';

class MortalDestinationPointsGetter{
  static List<Vector2> getDestinationPointsByRoom(Haunting_Room room, List<Vector2> mortalActionPoints) {
    List<Vector2> listOfAvailableDestinationPoints = [];
    for(final point in mortalActionPoints){
      if(room.containsPoint(point + Vector2(1, 1))){
        listOfAvailableDestinationPoints.add(point);
      }
    }
    return listOfAvailableDestinationPoints;
  }

}