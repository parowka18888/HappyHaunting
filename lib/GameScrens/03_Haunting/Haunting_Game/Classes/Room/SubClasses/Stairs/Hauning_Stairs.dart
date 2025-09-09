import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/CheckDestination/Destination_Checker.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/Stairs/Mechanics/StaisMechanics.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class Haunting_Stairs extends PositionComponent
    with HasGameReference<Haunting_Game>, TapCallbacks, CollisionCallbacks{

  Haunting_Stairs({super.position, super.size, required this.floorModifier});

  int floorModifier = 0;

  @override
  FutureOr<void> onLoad() {
    add(RectangleHitbox(
        position: Vector2(this.width * 0.25, this.height * 0.25),
        size: Vector2(this.width * 0.5, this.height * 0.5)
    ));
    return super.onLoad();
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    if(other is Haunting_Mortal){
      if(other.canChangeFloor == true){
        StairsMechanics.changeFloorForMortal(other, floorModifier, game);
      } else {
        Future.delayed(Duration(seconds: 5), (){
          Mortal_Setter.setCanChangeFloors(other, true);
          if(Destination_Checker.checkIfMortalReachedDestination_ByVector(other, position)){
            StairsMechanics.changeFloorForMortal(other, floorModifier, game);
          }
        });
      }
    }
    super.onCollisionStart(intersectionPoints, other);
  }

}