import 'package:flame/components.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';

import '../../../Setter/Mortal_Setter.dart';

class Destination_Checker{
  static void checkIfMortalReachedFinalDestination(Haunting_Mortal mortal){
    // print("WYWOŁANIE");
    // print("${mortal.position} VS ${mortal.finalDestination} CENTER -> ${mortal.absoluteCenter}");
    Vector2 mortalCenter = mortal.absoluteCenter;

    var mortalCenter_X = mortalCenter.x;
    var mortalCenter_Y = mortalCenter.y;

    var xLeft = mortalCenter.x - mortal.size.x;
    var xRight = mortalCenter.x + mortal.size.x;
    var yTop = mortalCenter.y - mortal.size.y;
    var yBottom = mortalCenter.y + mortal.size.y;

    if(mortalCenter_X > xLeft && mortalCenter_X < xRight){
      if(mortalCenter_Y > yTop && mortalCenter_Y < yBottom){
        if(mortal.isDefeated == false){
          Mortal_Setter.setFinalData(mortal, null, null);
        }
      }
    }
  }

  static bool checkIfMortalReachedDestination_ByVector(Haunting_Mortal mortal, Vector2 vector){
    // print("WYWOŁANIE");
    // print("${mortal.position} VS ${vector} CENTER -> ${mortal.absoluteCenter}");
    Vector2 mortalCenter = mortal.absoluteCenter;

    var mortalCenter_X = mortalCenter.x;
    var mortalCenter_Y = mortalCenter.y;

    var xLeft = vector.x -   mortal.size.x;
    var xRight = vector.x +  mortal.size.x;
    var yTop = vector.y -    mortal.size.y;
    var yBottom = vector.y + mortal.size.y;

    if(mortalCenter_X > xLeft && mortalCenter_X < xRight){
      if(mortalCenter_Y > yTop && mortalCenter_Y < yBottom){
        return true;
      }
    }
    return false;
  }
}