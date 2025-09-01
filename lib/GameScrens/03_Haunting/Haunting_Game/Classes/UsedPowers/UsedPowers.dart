import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';

class UsedPower{

  UsedPower({
    required this.power,
    required this.room,
    required this.floor,
    required this.ghost,
});

  late Haunting_Power power;
  late Haunting_Room room;
  late Haunting_Floor floor;
  late Haunting_Ghost ghost;

}