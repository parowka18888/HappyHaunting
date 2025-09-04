import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/04_Aura.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/00_LoadingGameElements/Room/LoadingRoom.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Effect/Haunting_Effect.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Mechanics/MixedClasses/RoomGhost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Setter/RoomSetter.dart';

import '../../Haunting_Game.dart';
import '../GhostSpot/Haunting_GhostSpot.dart';
import '../Mortal/Haunting_Mortal.dart';

class Haunting_Room extends PolygonComponent
    with HasGameReference<Haunting_Game>, TapCallbacks, CollisionCallbacks {

  Haunting_Room({
    required this.polygon,
    required this.auras,
    required this.id,
    required this.floorID,
  }) : super(polygon, paint: Paint()..color = const Color(0x00FF0000));

  //VARIABLE FOR "FILLING" POLYGON INTO RECTANGLE, FOR OPTIMIZING CALCULATIONS
  late final Rect boundingBox;

  final String id;
  final int floorID;
  final List<Aura> auras;
  final List<Haunting_GhostSpot> ghostSpots = [];
  final List<Vector2> polygon;
  List<Haunting_Effect> effects = [];
  List<Haunting_Mortal> mortalsInRoom = [];
  Haunting_Floor? floor;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // debugMode = true;
    add(PolygonHitbox(polygon));
    RoomSetter.setBoundingBox(this, polygon);

    for (final mortal in game.level.mortals) {
      if (containsPoint(mortal.position + Vector2(1, 1))) {
        mortalsInRoom.add(mortal);
        print("✅ Mortal ${mortal.name} startuje w pokoju $id, na floor ${mortal.floor?.id}");
      }
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    RoomSetter.setRoomColor(this, game.viewModel);

  }


  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    RoomGhost.placeGhost(game, this);
    print("Kliknięto pokój o id=$id");
  }



  void spawnClickEffect(Vector2 position) {
    final effect = ParticleSystemComponent(
      particle: Particle.generate(
        count: 30, // ile cząsteczek
        lifespan: 0.6, // jak długo trwają
        generator: (i) => AcceleratedParticle(
          // losowy kierunek i prędkość
          acceleration: (Vector2.random() - Vector2.random()) * 200,
          speed: (Vector2.random() - Vector2.random()) * 300,
          // child: SpriteParticle(
          //   sprite: sprite,
          //   size: Vector2.all(12), // rozmiar cząsteczki
          // ),
          child: CircleParticle(
            radius: 2 + (i % 3).toDouble(), // różne wielkości
            paint: Paint()..color = Colors.white,
          ),
        ),
      ),
      position: position,
    );

    add(effect);
  }



}
