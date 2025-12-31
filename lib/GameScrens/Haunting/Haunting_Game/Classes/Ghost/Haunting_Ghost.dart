import 'package:flame/components.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/GhostScript/GhostScript.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/GhostSpot/Mechanics/GhostSpot_Mechanics.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../../../Data/Database/DatabaseStructure/01_Power.dart';
import '../../../../../Data/Database/DatabaseStructure/04_Aura.dart';
import '../GhostSpot/Haunting_GhostSpot.dart';
import '../Power/Haunting_Power.dart';

class Haunting_Ghost extends Component with HasGameReference<Haunting_Game>{

  Haunting_Ghost({
    required this.name, required this.icon, required this.id,
    required this.powers, required this.auras,
    required this.health_Current, required this.health_Maximum,
    required this.image, required this.panelImage,
    required this.banishText, required this.reserveText, required this.recruitText, required this.hintText, required this.helpText, required this.freeingText,
  });
  String icon = "";
  String name = "";
  String id = "";
  String image = "";
  String panelImage = "";

  String banishText = "";
  String freeingText = "";
  String helpText = "";
  String hintText = "";
  String recruitText = "";
  String reserveText = "";

  List<Haunting_Power> powers = [];
  List<Aura> auras = [];

  double health_Current = 0;
  double health_Maximum = 0;
  double healthRestoringValue = 0.5;
  bool isDefeatable = true;
  bool isDefeated = false;

  bool isPlaced = false;
  Haunting_Room? room;
  Haunting_GhostSpot? ghostSpot;

  GhostScript? script;
  List<int> conditionsMet = [];
  bool isScriptExecuted = false;
  bool isFree = true;

  //TIME FOR SLOWING DOWN SOME METHODS
  double timeSinceLastReload = 0.0;
  double refreshTime = 1;


  @override
  Future<void> update(double dt) async {
    super.update(dt);
    timeSinceLastReload += dt;
    if (timeSinceLastReload >= refreshTime) {
      //HEALTH RESTORING SYSTEM
      if(health_Current < health_Maximum){
        if(isPlaced == false && isDefeatable == true && isDefeated == false){
          health_Current += healthRestoringValue;
          if(health_Current > health_Maximum){
            health_Current = health_Maximum;
          }
        }
      }
      //DEFEAT GHOST
      if(health_Current <= 0 && isDefeated == false){
        if(isPlaced == true && ghostSpot != null) GhostSpot_Mechanics.removeGhostFromGhostSpot(game, ghostSpot!);
        isDefeated = true;
        game.viewModel.setDialogData(banishText, true);
      }
      timeSinceLastReload = 0.0;
    }

  }

}