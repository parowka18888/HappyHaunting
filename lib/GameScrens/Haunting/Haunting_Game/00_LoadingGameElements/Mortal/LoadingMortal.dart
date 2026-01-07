import 'package:flame_tiled/flame_tiled.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/MortalScript/MortalScript.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/00_LoadingGameElements/GhostSpot/LoadingGhostSpot.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/00_LoadingGameElements/Mortal/LoadingPickUp.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Level/Haunting_Level.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:tiled/src/objects/tiled_object.dart';

import '../../../../../Data/Database/DatabaseStructure/02_Mortal.dart';
import '../../../../../Data/Database/Enums/Haunting/Scripts/LevelScript/LevelScript.dart';
import '../../Classes/GhostSpot/Haunting_GhostSpot.dart';
import '../../Classes/Level/Subclasses/Getter/FloorGetter.dart';
import '../../Classes/Level/Subclasses/Haunting_Floor.dart';
import '../../Classes/Mortal/Haunting_Mortal.dart';
import '../../Classes/Mortal/Mechanics/Getter/MortalGetter.dart';
import '../../Classes/PickUp/Haunting_PickUp.dart';

class LoadingMortal{
  static void loadMortal(TiledObject spawnPoint, Haunting_Game game) {
    String mortalID = spawnPoint.properties.getValue('mortalID');
    int floorID = spawnPoint.properties.getValue('floor');
    bool isTriggeredByScript = spawnPoint.properties.getValue('isTriggeredByScript');
    String scriptID = spawnPoint.properties.getValue('scriptID');

    Haunting_Floor? floor = FloorGetter.getFloorById(floorID, game);
    Mortal? mortal = MortalGetter.getMortalById_TypeMortal(mortalID, game);
    MortalScript? levelScript = null;

    if(scriptID != null && scriptID.length > 0){
      levelScript = MortalScript.values.byName(scriptID);
    }

    if(mortal != null && floor != null){
      print("Mortal ${mortal.id} jest na floorze ${floor.id}, który ma action points ${floor.mortalActionPoints}");
      final haunting_Mortal = Haunting_Mortal(
          position: spawnPoint.position,
          size: spawnPoint.size,
          id: mortal.id,
          icon: mortal.icon,
          fear: mortal.fear,
          name: "Haunting_${mortal.name}",
          stat_Fear: mortal.stat_Fear,
          stat_Health: mortal.stat_Health,
          stat_Madness: mortal.stat_Madness,
          stat_Faith: mortal.stat_Faith,
          stat_Impurity: mortal.stat_Impurity,
          stat_Emotions: mortal.stat_Emotions,
          exorcismStrength: mortal.exorcismStrength,
          stat_Multiplier_Fear: mortal.stat_Multiplier_Fear,
          stat_Multiplier_Health: mortal.stat_Multiplier_Health,
          stat_Multiplier_Madness: mortal.stat_Multiplier_Madness,
          stat_Multiplier_Faith: mortal.stat_Multiplier_Faith,
          stat_Multiplier_Emotions: mortal.stat_Multiplier_Emotions,
          stat_Multiplier_Impurity: mortal.stat_Multiplier_Impurity,
          stat_Current_Fear: 0,
          stat_Current_Health: 0,
          stat_Current_Madness: 0,
          stat_Current_Faith: 0,
          stat_Current_Emotions: 0,
          stat_Current_Impurity: 0,
          isActive: !isTriggeredByScript,
          script: levelScript,
          tags: mortal.mortalTags,
          floor: floor

      );

      Haunting_GhostSpot ghostSpot = LoadingGhostSpot.loadGhostSpotForMortal(spawnPoint, game, haunting_Mortal);
      haunting_Mortal.ghostSpot = ghostSpot;

      Haunting_PickUp pickUp = LoadingPickUp.loadPickUpObjectForMortal(spawnPoint, game, haunting_Mortal);
      haunting_Mortal.pickUp = pickUp;

      game.level.mortals.add(haunting_Mortal);
      game.level.level.add(haunting_Mortal);

    }
  }

}