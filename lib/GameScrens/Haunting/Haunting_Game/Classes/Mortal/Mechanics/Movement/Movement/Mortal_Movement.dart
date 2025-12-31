import 'package:flame/components.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Getter/MortalGetter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/CheckDestination/Destination_Checker.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Navigator.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Setter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/SubClasses/Stairs/Getter/StairsGetter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/SubClasses/Stairs/Hauning_Stairs.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

import '../../Setter/Mortal_Setter.dart';

class Mortal_Movement{

  static void moveInPath(Haunting_Mortal mortal, Haunting_Game game, double dt) {
    if (mortal.path.isNotEmpty) {
      Vector2 target = mortal.path.first;
      Vector2 direction = (target - mortal.position);
      double distance = direction.length;

      const double reachThreshold = 0.5;
      final double step = mortal.speed * dt;

      if (distance <= step + reachThreshold) {
        mortal.position.setFrom(target);
        mortal.path.removeAt(0);

        if (mortal.path.isEmpty) {
          if(mortal.finalDestination != null){
            Destination_Checker.checkIfMortalReachedFinalDestination(mortal);
          }
          if(mortal.canChangeFloor == false){
            Mortal_Destination_Navigator.setMortalNextDestination_Navigator(mortal, game);
          } else {
            MortalGetter.getThinkingTime(mortal, game);
            Mortal_Destination_Navigator.setMortalNextDestination_Navigator(mortal, game);
            // Future.delayed(Duration(seconds: MortalGetter.getThinkingTime(mortal, game)), (){
            //   Mortal_Destination_Navigator.setMortalNextDestination_Navigator(mortal, game);
            // });
          }
          return;
        }
      }
      mortal.position += direction.normalized() * step;
    }
  }


}