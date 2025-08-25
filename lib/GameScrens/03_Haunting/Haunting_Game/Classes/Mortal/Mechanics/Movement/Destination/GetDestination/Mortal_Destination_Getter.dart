import 'dart:math';

import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/Stairs/Hauning_Stairs.dart';
import 'package:vector_math/vector_math.dart';

class Mortal_Destination_Getter{

  static Random random = Random();

  //RANDOMIZING NEXT DESTINATION POINT FOR MORTAL
  static Vector2 getNextDestination(List<Vector2> mortalActionPoints) {
      var index = 0 + random.nextInt(mortalActionPoints.length);
      return mortalActionPoints[index];
    }

  static Vector2? getNextDestination_Special(List<Haunting_Stairs> listStairs) {
    if(listStairs.length > 0){
      listStairs.shuffle();
      return listStairs[0].position;
    } else {
      return null;
    }
  }

  static Vector2? getNextDestination_Stairs(List<Haunting_Stairs> listStairs) {
    if(listStairs.isNotEmpty){
      listStairs.shuffle();
      return listStairs[0].position;
    } else {
      return null;
    }
  }

}