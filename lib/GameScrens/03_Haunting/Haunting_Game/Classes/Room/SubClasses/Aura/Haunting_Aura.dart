import 'package:flame/components.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/04_Aura.dart';

import '../../../../Haunting_Game.dart';

class Haunting_Aura extends SpriteComponent with HasGameReference<Haunting_Game>{

  Haunting_Aura({super.position, super.size, required this.aura});

  Aura? aura;

  @override
  Future<void> onLoad() async {
    // debugMode = true;
    //IMAGE
    sprite = aura == null ? await game.loadSprite('Ghosts/Unknown_Ghost.png') : await game.loadSprite('Auras/${aura!.icon}.png');

    final baseSprite = SpriteComponent(      sprite: await game.loadSprite('Ghosts/Unknown_Ghost.png'),      size: Vector2(size.x, size.y),    );
    final overlaySprite = SpriteComponent(      sprite: await game.loadSprite('Auras/${aura!.icon}.png'),      size: Vector2(size.x, size.y),    );
    add(baseSprite);    add(overlaySprite);


   return super.onLoad();
  }

}