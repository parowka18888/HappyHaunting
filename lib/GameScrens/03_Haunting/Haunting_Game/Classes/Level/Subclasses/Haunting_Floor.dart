import 'package:flame/components.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Haunting_InteractiveObject.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/Stairs/Hauning_Stairs.dart';

class Haunting_Floor{
  Haunting_Floor({required this.id});

  int id = 0;
  List<Vector2> mortalActionPoints = [];
  List<Haunting_Stairs> listStairs = [];
  List<Haunting_InteractiveObject> listInteractiveObjects = [];
  List<Haunting_Room> listRooms = [];

}