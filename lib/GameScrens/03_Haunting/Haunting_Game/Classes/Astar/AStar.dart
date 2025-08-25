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

List<Vector2> findPathAStar(List<List<bool>> grid, Vector2 start, Vector2 goal) {
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
      if (!grid[ny][nx]) continue;

      // opcjonalnie: blokuj "przeciskanie się" przez narożniki
      if (offset.x != 0 && offset.y != 0) {
        if (!grid[current.y][nx] || !grid[ny][current.x]) {
          continue; // nie pozwalaj na cięcie narożników
        }
      }

      Node neighbor = Node(nx, ny);
      if (closedList.contains(neighbor)) continue;

      double stepCost = (offset.x != 0 && offset.y != 0) ? 1.414 : 1.0; // √2 dla ukosu
      double tentativeG = current.g + stepCost;

      bool isBetterPath = false;

      if (!openList.contains(neighbor)) {
        // Heurystyka lepsza dla 8 kierunków → "odległość Chebysheva"
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
    // for (var offset in [
    //   Vector2(1, 0),
    //   Vector2(-1, 0),
    //   Vector2(0, 1),
    //   Vector2(0, -1),
    // ]) {
    //   int nx = current.x + offset.x.toInt();
    //   int ny = current.y + offset.y.toInt();
    //
    //   if (nx < 0 || ny < 0 || ny >= grid.length || nx >= grid[0].length) continue;
    //   if (!grid[ny][nx]) continue;
    //
    //   Node neighbor = Node(nx, ny);
    //   if (closedList.contains(neighbor)) continue;
    //
    //   double tentativeG = current.g + 1;
    //   bool isBetterPath = false;
    //
    //   if (!openList.contains(neighbor)) {
    //     neighbor.h = ((goalNode.x - nx).abs() + (goalNode.y - ny).abs()).toDouble();
    //
    //     openList.add(neighbor);
    //     isBetterPath = true;
    //   } else if (tentativeG < neighbor.g) {
    //     isBetterPath = true;
    //   }
    //
    //   if (isBetterPath) {
    //     neighbor.g = tentativeG;
    //     neighbor.parent = current;
    //   }
    // }
  }

  return []; // brak ścieżki
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

Vector2 worldToGrid(Vector2 worldPos) {
  return Vector2(
    (worldPos.x / 16).floorToDouble(),
    (worldPos.y / 16).floorToDouble(),
  );
}

Vector2 gridToWorld(Vector2 gridPos) {
  return Vector2(
    gridPos.x * 16 + 8, // środek kafla
    gridPos.y * 16 + 8,
  );
}