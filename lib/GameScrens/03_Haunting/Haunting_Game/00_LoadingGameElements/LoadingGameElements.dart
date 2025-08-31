import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/04_Aura.dart';
import 'package:happyhaunting/Data/Database/Enums/Getter/EnumGetter.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseObject_Getter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/00_LoadingGameElements/Ghost/LoadingGhost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/00_LoadingGameElements/GhostSpot/LoadingGhostSpot.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/00_LoadingGameElements/Room/LoadingRoom.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Effect/Haunting_Effect.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Getter/GhostGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/TrappedGhost/Getter/TrappedGhost_Getter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Exit/Haunting_Exit.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Getter/FloorGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Getter/RoomGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/Aura/Haunting_Aura.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/GhostSpot/Haunting_GhostSpot.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/Stairs/Hauning_Stairs.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:hive/hive.dart';

import '../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
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
            String mortalID = spawnPoint.properties.getValue('mortalID');
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
          case 'Effect': {
            int effectIndex = spawnPoint.properties.getValue('effectIndex');
            String roomName = spawnPoint.properties.getValue('roomName');
            final room = RoomGetter.getRoomByName(roomName, game);
            if(room!=null){
              final effect = Haunting_Effect(index: effectIndex, position: spawnPoint.position, size: spawnPoint.size)..room = room;
              level.level.add(effect);
              room.effects.add(effect);
            }
            break;
          }
          case 'Ghost': {
            LoadingGhostSpot.loadGhostSpot(spawnPoint, game);
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
          case "TrappedGhost" : {
            Haunting_GhostSpot? ghostSpot = LoadingGhostSpot.loadGhostSpot(spawnPoint, game);
            if(ghostSpot != null){
              final ghostID = spawnPoint.properties.getValue('ghostID');
              final roomName = spawnPoint.properties.getValue('roomName');
              final room = RoomGetter.getRoomByName(roomName, game);
              final trappedGhost = TrappedGhost_Getter.getTrappedGhost_ByID(ghostID, game);
              if(room!=null && trappedGhost != null){
                Haunting_Ghost ghost = LoadingGhost.loadGhost(trappedGhost, game, level.trappedGhosts, isPlaced: true, room: room, ghostSpot: ghostSpot);
                ghostSpot.isTrap = true;
                ghostSpot.ghost = ghost;
              // level.level.add(trapped);
              }
            }


            // final room = RoomGetter.getRoomByName(roomName, game);
            // final trappedGhost = TrappedGhost_Getter.getTrappedGhost_ByID(ghostID, game);


            // if(room!=null && trappedGhost != null){
            //   Haunting_Ghost ghost = LoadingGhost.loadGhost(trappedGhost, game, level.trappedGhosts, isPlaced: true, room: room);
            //   Haunting_TrappedGhost trapped = Haunting_TrappedGhost(
            //       position: spawnPoint.position,
            //       size: spawnPoint.size,
            //       ghost: ghost
            //   );
              // level.level.add(trapped);
            // }
            break;
          }
        }
      }
    }

    for(final ghost in game.ghosts){
      LoadingGhost.loadGhost(ghost, game, level.ghosts);
    }
  }


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
          case 'MortalSpecialPoint_Exit' : {
            int floorID = point.properties.getValue('floor');
            Haunting_Floor? floor = FloorGetter.getFloorById(floorID, game);
            if(floor != null){
              Haunting_Exit exit = Haunting_Exit(
                  position: point.position,
                  size: point.size,
                  floor: floor
              );
              level.exitPoints.add(exit);
              game.add(exit);
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



}