import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/Stairs/Mechanics/StaisMechanics.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class Haunting_Exit extends PositionComponent
    with HasGameReference<Haunting_Game>, TapCallbacks, CollisionCallbacks{

  Haunting_Exit({super.position, super.size, required this.floor});

  Haunting_Floor floor;

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
      if(other.isDefeated == true){
        other.position.x = game.width * 2;
        other.canMove = false;
        other.isEscaped = true;
        other.room = null;
        other.floor = null;
      }
    }
    super.onCollisionStart(intersectionPoints, other);
  }

}