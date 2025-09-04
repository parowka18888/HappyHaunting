import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Checker/InteractiveObject_CheckConditions.dart';

import '../../../../Haunting_Game.dart';

class Haunting_InteractiveObject extends PositionComponent
with HasGameReference<Haunting_Game>, TapCallbacks, CollisionCallbacks{
  Haunting_InteractiveObject({super.position, super.size, required this.floor, required this.room,
  required this.id, required this.sound_Start, required this.sound_End, required this.time, required this.isSeducing
  });

  Haunting_Floor? floor;
  Haunting_Room? room;
  String id = "";
  String? sound_Start;
  String? sound_End;
  double time = 0;
  bool isSeducing = false;

  //USING OBJECT DATA
  bool isActive = true;
  bool canBeUsed = true;
  bool isInUse = false;
  double timeOfUse = 0;


  //TIME FOR SLOWING DOWN SOME METHODS
  double timeSinceLastReload = 0.0;
  double refreshTime = 0.5;

  @override
  FutureOr<void> onLoad() {
    // debugMode = true;
    add(RectangleHitbox(
        position: Vector2(this.width * 0.25, this.height * 0.25),
        size: Vector2(this.width * 0.5, this.height * 0.5)
    ));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if(isActive == true){
      //TIMER FOR SLOWING DOWN CERTAIN ACTIONS
      //REFRESH TIME IS A STAMP FOR EXECUTING CODE
      timeSinceLastReload += dt;
      if (timeSinceLastReload >= refreshTime) {
        //CHECK USABILITY OF OBJECT
        isInUse = InteractiveObject_CheckConditions.checkIfObjectIsInUse(this, game);
        canBeUsed = InteractiveObject_CheckConditions.checkIfObjectCanBeUsed(this, game);
        // print("isInYUSe -> ${isInUse} can be used -> ${canBeUsed}, time of use -> ${timeOfUse}");
        //MEASURING USE TIME
        if(isInUse == true) {
          timeOfUse += refreshTime;
        } else {
          timeOfUse = 0;
        }
        timeSinceLastReload = 0.0;
      }
    }

    super.update(dt);
  }

}