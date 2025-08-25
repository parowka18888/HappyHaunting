import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class FloorGetter{
  static Haunting_Floor? getFloorById(int id, Haunting_Game game) {
    Haunting_Floor? floor = game.level.floors.firstWhere((floor) => floor.id == id, orElse: null);
    return floor;
  }


}