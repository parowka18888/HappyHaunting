import 'package:flame_tiled/flame_tiled.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Haunting_Level.dart';

class AStar_Grid{
  static void getWalkableGrid(Haunting_Level level) {
    final collisions = level.level.tileMap.getLayer<ObjectGroup>('Collisions');

    if (collisions != null) {
      final mapWidth = level.level.tileMap.map.width;
      final mapHeight = level.level.tileMap.map.height;
      final tileSize = 16;

      level.walkableGrid = List.generate(mapHeight, (y) => List.generate(mapWidth, (x) => true));


      for (final obj in collisions.objects) {
        if(level.listOfIgnoredCollisions_ID.contains(obj.id)){
          continue;
        }
        // if (obj.id == 5 || obj.id == 4 || obj.id == 6) {
        //   continue;
        // }

        final startX = (obj.x / tileSize).floor();
        final startY = (obj.y / tileSize).floor();
        final endX = ((obj.x + obj.width) / tileSize).ceil();
        final endY = ((obj.y + obj.height) / tileSize).ceil();

        for (int ty = startY; ty < endY; ty++) {
          for (int tx = startX; tx < endX; tx++) {
            if (ty >= 0 && tx >= 0 && ty < mapHeight && tx < mapWidth) {
              level.walkableGrid[ty][tx] = false;
            }
          }
        }
      }
    }
  }

}