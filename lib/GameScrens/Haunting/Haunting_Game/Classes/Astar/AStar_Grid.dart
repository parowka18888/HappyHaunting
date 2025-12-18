import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Level/Haunting_Level.dart';

class AStar_Grid{
  static void getWalkableGrid(Haunting_Level level) {
    final collisions = level.level.tileMap.getLayer<ObjectGroup>('Collisions');

    if (collisions != null) {
      final mapWidth = level.level.tileMap.map.width;
      final mapHeight = level.level.tileMap.map.height;
      final tileWidth = level.game.tileWidth;
      final tileHeight = level.game.tileHeight;

      level.walkableGrid = List.generate(mapHeight, (y) => List.generate(mapWidth, (x) => true));


      for (final obj in collisions.objects) {
        if(level.listOfIgnoredCollisions_ID.contains(obj.id)){
          continue;
        }
        if (obj.isPolygon) {
          final polygon = obj.polygon.map((p) => Point(x: p.x + obj.x, y: p.y + obj.y)).toList();

          // final polygon = obj.polygon.map((p) {
          //   Vector2(obj.x + p.x, obj.y + p.y);
          // }).toList();

          for (int ty = 0; ty < mapHeight; ty++) {
            for (int tx = 0; tx < mapWidth; tx++) {
              final tileCenterX = (tx + 0.5) * tileWidth;
              final tileCenterY = (ty + 0.5) * tileHeight;

              if (isPointInPolygon(tileCenterX, tileCenterY, polygon)) {
                level.walkableGrid[ty][tx] = false;
              }
            }
          }
        } else {
          final startX = (obj.x / tileWidth).floor();
          final startY = (obj.y / tileHeight).floor();
          final endX = ((obj.x + obj.width) / tileWidth).ceil();
          final endY = ((obj.y + obj.height) / tileHeight).ceil();

          for (int ty = startY; ty < endY; ty++) {
            for (int tx = startX; tx < endX; tx++) {
              if (ty >= 0 && tx >= 0 && ty < mapHeight && tx < mapWidth) {
                level.walkableGrid[ty][tx] = false;
              }
            }
          }
        }






        // if (obj.id == 5 || obj.id == 4 || obj.id == 6) {
        //   continue;
        // }

      }
    }
  }

  static bool isPointInPolygon(double x, double y, List<Point> polygon) {
    int i, j = polygon.length - 1;
    bool oddNodes = false;

    for (i = 0; i < polygon.length; i++) {
      final pi = polygon[i];
      final pj = polygon[j];
      if (y > pi.y && y <= pj.y || y > pj.y && y <= pi.y) {
        if (x <= (pj.x - pi.x) * (y - pi.y) / (pj.y - pi.y) + pi.x) {
          oddNodes = !oddNodes;
        }
      }
      j = i;
    }
    return oddNodes;
  }

}