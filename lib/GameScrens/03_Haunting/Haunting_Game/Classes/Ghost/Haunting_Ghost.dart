import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/GhostScript/GhostScript.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Haunting_GhostSpot.dart';

import '../../../../../Data/Database/DatabaseStructure/01_Power.dart';
import '../../../../../Data/Database/DatabaseStructure/04_Aura.dart';

class Haunting_Ghost{

  Haunting_Ghost({
    required this.name, required this.icon,
    required this.powers, required this.auras,
  });
  String icon = "";
  String name = "";
  List<Haunting_Power> powers = [];
  List<Aura> auras = [];

  bool isPlaced = false;
  Haunting_Room? room;
  Haunting_GhostSpot? ghostSpot;

  String? hintText;
  String? freeingText;
  GhostScript? script;
  bool isScriptExecuted = false;


}