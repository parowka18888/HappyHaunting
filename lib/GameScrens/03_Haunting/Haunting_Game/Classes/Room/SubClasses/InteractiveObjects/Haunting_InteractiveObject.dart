import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';

import '../../../../Haunting_Game.dart';

class Haunting_InteractiveObject extends PositionComponent
with HasGameReference<Haunting_Game>, TapCallbacks, CollisionCallbacks{
  Haunting_InteractiveObject({super.position, super.size, required this.floor,
  required this.id, required this.sound_Start, required this.sound_End, required this.time, required this.isSeducing
  });

  Haunting_Floor? floor;
  String id = "";
  String? sound_Start;
  String? sound_End;
  double time = 0;
  bool isSeducing = false;

  @override
  FutureOr<void> onLoad() {
    // debugMode = true;
    add(RectangleHitbox(
        position: Vector2(this.width * 0.25, this.height * 0.25),
        size: Vector2(this.width * 0.5, this.height * 0.5)
    ));
    return super.onLoad();
  }


}