import 'dart:math';

import 'package:flame/components.dart';

class Node {
  final int x, y;
  double g, h;
  Node? parent;

  Node(this.x, this.y, {this.g = 0, this.h = 0});

  double get f => g + h;

  @override
  bool operator ==(Object other) => other is Node && x == other.x && y == other.y;
  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

bool isWalkable(List<List<bool>> grid, int nx, int ny, int spriteWidth, int spriteHeight) {
  for (int dx = 0; dx < spriteWidth; dx++) {
    for (int dy = 0; dy < spriteHeight; dy++) {
      int gx = nx + dx;
      int gy = ny + dy;
      if (gy < 0 || gx < 0 || gy >= grid.length || gx >= grid[0].length) {
        return false;
      }
      if (!grid[gy][gx]) return false;
    }
  }
  return true;
}

List<Vector2> findPathAStar(List<List<bool>> grid, Vector2 start, Vector2 goal, int mortalWidthInTiles, int mortalHeightInTiles) {
  final openList = <Node>[];
  final closedList = <Node>[];

  Node startNode = Node(start.x.toInt(), start.y.toInt());
  Node goalNode = Node(goal.x.toInt(), goal.y.toInt());

  openList.add(startNode);

  while (openList.isNotEmpty) {
    openList.sort((a, b) => a.f.compareTo(b.f));
    Node current = openList.removeAt(0);
    closedList.add(current);

    if (current.x == goalNode.x && current.y == goalNode.y) {
      return reconstructPath(current);
    }

    for (var offset in [
      Vector2(1, 0),
      Vector2(-1, 0),
      Vector2(0, 1),
      Vector2(0, -1),
      Vector2(1, 1),
      Vector2(-1, 1),
      Vector2(1, -1),
      Vector2(-1, -1),
    ]) {
      int nx = current.x + offset.x.toInt();
      int ny = current.y + offset.y.toInt();

      if (nx < 0 || ny < 0 || ny >= grid.length || nx >= grid[0].length) continue;
      if (!isWalkable(grid, nx, ny, mortalWidthInTiles, mortalHeightInTiles)) continue;
      // if (!grid[ny][nx]) continue;

      if (offset.x != 0 && offset.y != 0) {
        if (!grid[current.y][nx] || !grid[ny][current.x]) {
          continue;
        }
      }

      Node neighbor = Node(nx, ny);
      if (closedList.contains(neighbor)) continue;

      double stepCost = (offset.x != 0 && offset.y != 0) ? 1.414 : 1.0;
      double tentativeG = current.g + stepCost;

      bool isBetterPath = false;

      if (!openList.contains(neighbor)) {
        neighbor.h = max((goalNode.x - nx).abs(), (goalNode.y - ny).abs()).toDouble();
        openList.add(neighbor);
        isBetterPath = true;
      } else if (tentativeG < neighbor.g) {
        isBetterPath = true;
      }

      if (isBetterPath) {
        neighbor.g = tentativeG;
        neighbor.parent = current;
      }
    }
  }

  return [];
}

List<Vector2> reconstructPath(Node node) {
  List<Vector2> path = [];
  Node? current = node;
  while (current != null) {
    path.add(Vector2(current.x.toDouble(), current.y.toDouble()));
    current = current.parent;
  }
  return path.reversed.toList();
}

Vector2 worldToGrid(Vector2 worldPos, int tileSize) {
  return Vector2(
    (worldPos.x / tileSize).floorToDouble(),
    (worldPos.y / tileSize).floorToDouble(),
  );
}

Vector2 gridToWorld(Vector2 gridPos, int tileSize) {
  return Vector2(
    gridPos.x * tileSize + 8,
    gridPos.y * tileSize + 8,
  );
}