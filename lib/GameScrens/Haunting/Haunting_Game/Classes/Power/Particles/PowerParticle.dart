import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';

import '../../GhostSpot/Haunting_GhostSpot.dart';


class PowerParticle{
  // static void clearSpot_Particle(Vector2 position, Vector2 target, Haunting_GhostSpot ghostSpot) {
  //   final direction = (target - position).normalized();
  //
  //   final effect = ParticleSystemComponent(
  //     particle: Particle.generate(
  //       count: 30,
  //       lifespan: 0.8, // jak długo mają żyć
  //       generator: (i) {
  //         // lekko rozpraszamy kierunek, żeby nie wszystkie były identyczne
  //         final randomOffset = Vector2.random() - Vector2.random();
  //         final velocity = (direction + randomOffset * 0.1).normalized() * (150 + i * 10);
  //
  //         return AcceleratedParticle(
  //           // już nie losowa akceleracja, można dać lekkie spowalnianie
  //           acceleration: -velocity * 1.5,
  //           speed: velocity,
  //           child: CircleParticle(
  //             radius: 2 + (i % 3).toDouble(),
  //             paint: Paint()..color = Colors.white,
  //           ),
  //         );
  //       },
  //     ),
  //     position: position,
  //   );
  //
  //   ghostSpot.add(effect);
  // }

  static void globalPower(Vector2 position, Haunting_GhostSpot ghostSpot) {
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

  static void damagePower(Vector2 position, Haunting_Mortal mortal, Color color) {
    final effect = ParticleSystemComponent(
      particle: Particle.generate(
        count: 10, // ile cząsteczek
        lifespan: 0.6, // jak długo trwają
        generator: (i) => AcceleratedParticle(
          // losowy kierunek i prędkość
          acceleration: (Vector2.random() - Vector2.random()) * 200,
          speed: (Vector2.random() - Vector2.random()) * 100,
          child: CircleParticle(
            radius: 2 + (i % 3).toDouble(), // różne wielkości
            paint: Paint()..color = color,
          ),
        ),
      ),
      position: position,
    );

    mortal.add(effect);
  }
  static void travelParticles(Vector2 from, Vector2 to, Haunting_GhostSpot? ghostSpot) {
    final rand = Random();

    final effect = ParticleSystemComponent(
      particle: Particle.generate(
        count: 5,
        lifespan: 1.8, // czas podróży
        generator: (i) {
          final offsetStrength = 20.0 + rand.nextDouble() * 50; // siła falowania
          final freq = 1.5 + rand.nextDouble() * 3;             // częstotliwość
          final phase = rand.nextDouble() * pi * 2;             // przesunięcie fazy
          final color = Colors.white.withOpacity(0.9);

          return ComputedParticle(
            lifespan: 1.8,
            renderer: (canvas, particle) {
              final t = particle.progress; // 0 → 1
              final easedT = Curves.easeInOut.transform(t); // płynniejsze ruchy

              // interpolacja głównej pozycji
              final base = from + (to - from) * easedT;

              // falowanie w bok
              final perpendicular = Vector2(-(to.y - from.y), to.x - from.x).normalized();
              final wiggle = sin(t * freq * pi * 2 + phase) * offsetStrength * (1 - t);

              final pos = base + perpendicular * wiggle;

              // promień – lekkie pulsowanie
              final radius = 3.0 + sin(t * pi * 2 + phase) * 1.2;

              // alpha – stopniowe zanikanie
              final alpha = (1 - t).clamp(0, 1).toDouble();

              final paint = Paint()
                ..color = color.withOpacity(alpha);
              // ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4); // glow

              canvas.drawCircle(Offset(pos.x, pos.y), radius, paint);

              // efekt w punkcie docelowym
              if (t > 0.95) {
                final targetPaint = Paint()
                  ..color = Colors.yellow.withOpacity((1 - t) * 5)
                  ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
                canvas.drawCircle(Offset(to.x, to.y), 6 * (1 - t), targetPaint);
              }
            },
          );
        },
      ),
    );

    if(ghostSpot != null){
      ghostSpot.add(effect);
    } else {

    }

  }
}
