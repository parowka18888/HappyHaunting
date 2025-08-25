import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Haunting_GhostSpot.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class GhostSpot_Particle{

  static Future<void> clearSpot_Particle_Image(Vector2 position, Haunting_GhostSpot ghostSpot) async {
    // Wczytaj obrazek jako Sprite
    final sprite = await Sprite.load('Powers/particleTest.png');
    final effect = ParticleSystemComponent(
      particle: Particle.generate(
        count: 30,
        lifespan: 0.6,
        generator: (i) => AcceleratedParticle(
          acceleration: (Vector2.random() - Vector2.random()) * 200,
          speed: (Vector2.random() - Vector2.random()) * 300,
          child: SpriteParticle(
            sprite: sprite,
            size: Vector2.all(8), // wielkość obrazka
          ),
        ),
      ),
      position: position,
    );

    ghostSpot.add(effect);
  }

  static void clearSpot_Particle(Vector2 position, Haunting_GhostSpot ghostSpot) {
    final effect = ParticleSystemComponent(
      particle: Particle.generate(
        count: 30, // ile cząsteczek
        lifespan: 0.6, // jak długo trwają
        generator: (i) => AcceleratedParticle(
          // losowy kierunek i prędkość
          acceleration: (Vector2.random() - Vector2.random()) * 200,
          speed: (Vector2.random() - Vector2.random()) * 300,
          child: CircleParticle(
            radius: 2 + (i % 3).toDouble(), // różne wielkości
            paint: Paint()..color = Colors.white,
          ),
        ),
      ),
      position: position,
    );

    ghostSpot.add(effect);
  }
}