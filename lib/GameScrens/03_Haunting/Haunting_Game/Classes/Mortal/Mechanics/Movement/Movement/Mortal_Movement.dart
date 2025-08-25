import 'package:flame/components.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Getter/MortalGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../Setter/Mortal_Setter.dart';

class Mortal_Movement{

  static void moveInPath(Haunting_Mortal mortal, Haunting_Game game, double dt) {
    if (mortal.path.isNotEmpty) {
      Vector2 target = mortal.path.first;
      Vector2 direction = (target - mortal.position);
      double distance = direction.length;

      if (distance < 1) {
        mortal.path.removeAt(0);
        if (mortal.path.isEmpty) {
          Future.delayed(Duration(seconds: MortalGetter.getThinkingTime()), (){
            Mortal_Destination_Setter.setNextDestination(mortal, game);
          });
          return;
        }
      } else {
        mortal.position += direction.normalized() * mortal.speed * dt;
      }
    }
  }

}