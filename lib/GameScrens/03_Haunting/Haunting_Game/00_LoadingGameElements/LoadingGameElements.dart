import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/04_Aura.dart';
import 'package:happyhaunting/Data/Database/Enums/Getter/EnumGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/00_LoadingGameElements/Room/LoadingRoom.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Getter/FloorGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Getter/RoomGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/Aura/Haunting_Aura.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Haunting_GhostSpot.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/Stairs/Hauning_Stairs.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../../Data/Database/DatabaseStructure/03_Level.dart';
import '../../../../Data/Database/Enums/PowerType.dart';
import '../Classes/Level/Haunting_Level.dart';

class LoadingGameElements{

  static Haunting_Level loadLevel(Haunting_Game game) {
    var world = Haunting_Level(levelName: game.levelName)
      ..viewModel = game.viewModel;
    game.add(world);
    return world;
  }

  static void loadLevelObjects(Haunting_Level level, Haunting_Game game) {

    int mortalIndex = 0;

    final spawnPointsLayer = level.level.tileMap.getLayer<ObjectGroup>('SpawnPoints');
    if(spawnPointsLayer != null){
      for(final spawnPoint in spawnPointsLayer.objects){
        switch(spawnPoint.class_){
          case 'Mortal': {
            String pointName = spawnPoint.name;
            List<String> pointName_Parts = pointName.split('_');
            int floorID = int.parse(pointName_Parts[2]);
            final mortal = Haunting_Mortal(
              position: spawnPoint.position,
              size: spawnPoint.size,
              icon: game.mortals[mortalIndex].icon,
              name: "Haunting_${game.mortals[mortalIndex].name}",
              stat_Fear: game.mortals[mortalIndex].stat_Fear,
              stat_Health: game.mortals[mortalIndex].stat_Health,
              stat_Madness: game.mortals[mortalIndex].stat_Madness,
              stat_Faith: game.mortals[mortalIndex].stat_Faith,
              stat_Multiplier_Fear: game.mortals[mortalIndex].stat_Multiplier_Fear,
              stat_Multiplier_Health: game.mortals[mortalIndex].stat_Multiplier_Health,
              stat_Multiplier_Madness: game.mortals[mortalIndex].stat_Multiplier_Madness,
              stat_Multiplier_Faith: game.mortals[mortalIndex].stat_Multiplier_Faith,
              stat_Current_Fear: 0,
              stat_Current_Health: 0,
              stat_Current_Madness: 0,
              stat_Current_Faith: 0,
              floor: FloorGetter.getFloorById(floorID, game)
              
            );
            mortalIndex++;
            level.mortals.add(mortal);
            level.level.add(mortal);
            break;
          }
          case 'Ghost': {
            final ghostSpot = Haunting_GhostSpot(
                position: spawnPoint.position,
                size: spawnPoint.size,
                id: spawnPoint.name);
            level.ghostSpots.add(ghostSpot);

            final roomName = spawnPoint.properties.getValue('roomName');
            final room = RoomGetter.getRoomByName(roomName, game);
            if(room!=null) room.ghostSpots.add(ghostSpot);
            level.level.add(ghostSpot);

            break;
          }
          case "Aura" : {
            final roomName = spawnPoint.properties.getValue('roomName');
            final auraIndex = spawnPoint.properties.getValue('auraIndex');
            final room = RoomGetter.getRoomByName(roomName, game);
            if(room!=null){
              if(room.auras.length > auraIndex){
                final aura = Haunting_Aura(aura: room.auras[auraIndex], size: spawnPoint.size, position: spawnPoint.position);
                level.level.add(aura);
              }

            }
            break;
          }
        }
      }
    }

    for(final ghost in game.ghosts){
      List<Haunting_Power> powers = [];
      for(var ghostPower in ghost.powers){
        PowerType type = EnumGetter.getPowerTypeByString(ghostPower.powerType);
        Haunting_Power power = Haunting_Power(id: ghostPower.id, name: ghostPower.name, description: ghostPower.description,
            icon: ghostPower.icon, cost: ghostPower.cost, cooldown: ghostPower.cooldown,
            stat_Fear: ghostPower.stat_Fear, stat_Health: ghostPower.stat_Health, stat_Madness: ghostPower.stat_Madness, stat_Faith: ghostPower.stat_Faith,
            isActivated: false, isDeactivatingForbidden: false, powerType:  type
        );
        level.level.add(power);
        powers.add(power);
      }
      var hauntingGhost = Haunting_Ghost(name: ghost.name, icon: ghost.icon, powers: powers, auras: ghost.auras);
      level.ghosts.add(hauntingGhost);
    }
  }


  // static void loadLevelMortalActionPoints(Haunting_Level level) {
  //     final actionPointsLayer = level.level.tileMap.getLayer<ObjectGroup>('MortalActionPoints');
  //     if(actionPointsLayer != null){
  //       for (final point in actionPointsLayer.objects) {
  //         switch(point.class_){
  //           case 'MortalActionPoint' : {
  //             print("dodawanie miejsca akcji");
  //             level.mortalActionPoints.add(Vector2(point.x, point.y));
  //           }
  //         }
  //       }
  //     }
  // }

  static void loadLevelMortalActionPoints(Haunting_Level level, Haunting_Game game) {
    final actionPointsLayer = level.level.tileMap.getLayer<ObjectGroup>('MortalDestinationPoints');
    
    if(actionPointsLayer != null){
      for (final point in actionPointsLayer.objects) {
        switch(point.class_){
          case 'MortalActionPoint' : {
            String pointName = point.name;
            List<String> pointName_Parts = pointName.split('_');
            int floorID_ByPoint = int.parse(pointName_Parts[1]);
            //GET FLOOR BY POINT ID AND ADD POINT TO ITS LIST
            Haunting_Floor? floorByID = FloorGetter.getFloorById(floorID_ByPoint, game);
            if(floorByID != null){
              floorByID.mortalActionPoints.add(Vector2(point.x, point.y));
            }
          }
        }
      }
    }
  }

  static void loadLevelMortalSpecialPoints(Haunting_Level level, Haunting_Game game) {
    final actionPointsLayer = level.level.tileMap.getLayer<ObjectGroup>('MortalSpecialPoints');
    if(actionPointsLayer != null){
      for (final point in actionPointsLayer.objects) {
        // MortalSpecialPoint_Stairs
        switch(point.class_){
          case 'MortalSpecialPoint_Stairs' : {
            int floorID = point.properties.getValue('floor');
            int floorChangingValue = point.properties.getValue('floorChangingValue');

            Haunting_Stairs stairs = Haunting_Stairs(
                position: point.position,
                size: point.size,
                floorModifier: floorChangingValue
            );

            Haunting_Floor? floor = FloorGetter.getFloorById(floorID, game);
            if(floor != null){
              floor.listStairs.add(stairs);
              game.add(stairs);
            }
          }
        }
      }
    }
  }

  static void loadLevelRooms(Haunting_Level level, Haunting_Game game) {
    final roomLayer = level.level.tileMap.getLayer<ObjectGroup>('Rooms');
    if(roomLayer != null){
      for (final room in roomLayer.objects) {
        switch(room.class_){
          case 'Room' : {
            String auras_String = room.properties.getValue('auras');
            List<String> listOfAuras_String = LoadingRoom.getSeparatedAuras(auras_String);
            List<Aura> auras = LoadingRoom.getListOfAuras(listOfAuras_String);

            if (room.isPolygon) {
              final polygonPoints = room.polygon.map((p) {
                return Vector2(room.x + p.x, room.y + p.y);
              }).toList();
              Haunting_Room haunting_room = Haunting_Room(
                  // position: room.position,
                  polygon: polygonPoints,
                  auras: auras,//spawnPoint.properties.getValue('offNeg');
                  floorID: room.properties.getValue('floor'),
                  id: room.name
              );
              level.rooms.add(haunting_room);
              level.level.add(haunting_room);
            }
          }
        }
      }
    }
  }

  static void loadLevelFloors(Haunting_Level level, Haunting_Game game) {
    List<Haunting_Room> listOfRooms = game.level.rooms;
    for(Haunting_Room room in listOfRooms){
      //IF FLOOR WITH ID DOES NOT EXIST CREATE ONE
      if((level.floors.any((floor) => floor.id == room.floorID))){} else {
        print("nie ma floor o id ${room.floorID} -> tworzenie");
        Haunting_Floor floor = Haunting_Floor(id: room.floorID);
        level.floors.add(floor);
      }
      //GET FLOOR BY ID AND ADD ROOM TO ITS LIST
      Haunting_Floor? floorByID = FloorGetter.getFloorById(room.floorID, game);
      if(floorByID != null){
        floorByID.listRooms.add(room);
        room.floor = floorByID;
      }
    }
  }


  // static void loadFloorsByActionPoints(Haunting_Level haunting_level) {
  //   List<Vector2> actionPoints = haunting_level.mortalActionPoints;
  //   for(Vector2 actionPoint in actionPoints){
  //
  //   }
  // }


}