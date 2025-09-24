import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

import '../../Classes/Mortal/Haunting_Mortal.dart';
import '../../Classes/PickUp/Haunting_PickUp.dart';
import '../../Haunting_Game.dart';

class LoadingPickUp{
  static Haunting_PickUp loadPickUpObjectForMortal(TiledObject spawnPoint, Haunting_Game game, Haunting_Mortal mortal) {
    Vector2 size = spawnPoint.size;
    Vector2 position = spawnPoint.position;

    double sizeModifier = 0.6;
    size.x = size.x * sizeModifier;
    size.y = size.y * sizeModifier;

    position.x = 0 - spawnPoint.size.x / 2;
    position.y = spawnPoint.size.y - size.y / 2;

    final pickUp = Haunting_PickUp(
        position: position, size: size
    );
    // mortal.pickUpObject = pickUp;
    mortal.add(pickUp);
    // game.level.level.add(pickUp);
    return pickUp;

  }
}