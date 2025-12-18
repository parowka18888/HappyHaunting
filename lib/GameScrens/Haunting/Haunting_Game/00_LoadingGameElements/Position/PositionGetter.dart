import 'dart:math';

import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:vector_math/vector_math.dart';
import 'package:flame_tiled/flame_tiled.dart';

class PositionGetter{
  static getPosition(Haunting_Game game, Vector2 position) {

    final tiledMap = game.level.level.tileMap;
    final orientation = tiledMap.map.orientation;

    if(orientation == MapOrientation.orthogonal){
      return position;
    } else {
      // return position;
    final double tileWidth = game.tileWidth.toDouble();
    final double tileHeight = game.tileHeight.toDouble();
    // final double originX = game.height * tileWidth / 2;
    // final tileY = position.y / tileHeight;
    // final tileX = position.x / tileHeight;
    //
    // print('tileWidth: $tileWidth');
    // print('tileHeight: $tileHeight');
    // print('originX: $originX');
    // print('tileX: $tileX');
    // print('tileY: $tileY');

      print("${position.x} ${position.y}");
      double screenX = (position.x - position.y) * tileWidth / 2;
      double screenY = (position.x + position.y) * tileHeight / 2;
      print(screenX);
      print(screenY);
      return Vector2(screenX, screenY);

  // print(newX);
  // print(newY);
    // return Vector2((tileX - tileY) * tileWidth / 2 + originX,
    // (tileX + tileY) * tileHeight / 2);

    }


  }

}