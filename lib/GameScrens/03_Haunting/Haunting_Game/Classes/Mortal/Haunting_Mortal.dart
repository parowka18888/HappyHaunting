import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/CheckConditions/MortalChecker.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Getter/MortalGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/Mortal_Destination.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Movement/Mortal_Movement.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Mechanics/MixedClasses/RoomMortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

// class Haunting_Mortal extends SpriteComponent {
class Haunting_Mortal extends SpriteComponent with HasGameReference<Haunting_Game>, TapCallbacks {

  Haunting_Mortal({
    super.position, super.size,
    required this.icon, required this.name,
    required this.stat_Fear, required this.stat_Health, required this.stat_Madness, required this.stat_Faith,
    required this.stat_Current_Fear, required this.stat_Current_Health, required this.stat_Current_Madness, required this.stat_Current_Faith,
    required this.stat_Multiplier_Fear, required this.stat_Multiplier_Health, required this.stat_Multiplier_Madness, required this.stat_Multiplier_Faith,
    required this.floor

  });

  String icon = "";
  String name = "";
  double stat_Fear = 0;
  double stat_Health = 0;
  double stat_Madness = 0;
  double stat_Faith = 0;

  double stat_Current_Fear = 0;
  double stat_Current_Health = 0;
  double stat_Current_Madness = 0;
  double stat_Current_Faith = 0;

  double stat_Multiplier_Fear = 0;
  double stat_Multiplier_Health = 0;
  double stat_Multiplier_Madness = 0;
  double stat_Multiplier_Faith = 0;

  Haunting_Floor? floor;
  Haunting_Room? room;

  bool canChangeFloor = true;


  //TIME FOR SLOWING DOWN SOME METHODS
  double timeSinceLastReload = 0.0;
  double refreshTime = 0.5;

  //LURING / ESCAPING DESTINATION
  Vector2? finalDestination;
  Haunting_Floor? finalFloor;




  Vector2 currentDestination = Vector2(0, 0);
  List<Vector2> path = [];

  double speed = 50;

  @override
  Future<void> onLoad() async {
    // debugMode = true;

    //IMAGE
    sprite = await game.loadSprite('Mortals/$icon.png');

    //CHANGING BOX
    add(RectangleHitbox(
        position: Vector2(this.width * 0.25, this.height * 0.25),
        size: Vector2(this.width * 0.5, this.height * 0.5)
    ));

    Mortal_Destination_Setter.setNextDestination(this, game);

    // final baseSprite = SpriteComponent(      sprite: await game.loadSprite('mortals/base.png'),      size: Vector2(64, 64),    );
    // // Nakładka (np. kapelusz, aura, itp.)
    // final overlaySprite = SpriteComponent(      sprite: await game.loadSprite('mortals/overlay.png'),      size: Vector2(64, 64),    );
    // add(baseSprite);    add(overlaySprite);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
      Mortal_Movement.moveInPath(this, game, dt);

      timeSinceLastReload += dt;
      if (timeSinceLastReload >= refreshTime) {
        RoomMortal.assignMortalToRoom(this, game);
        // MortalChecker.checkIfMortalIsInCorrectRoom(this, game);
        timeSinceLastReload = 0.0;
      }
  }



}