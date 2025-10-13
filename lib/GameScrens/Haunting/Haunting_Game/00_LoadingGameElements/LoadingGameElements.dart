import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/02_Mortal.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/04_Aura.dart';
import 'package:happyhaunting/Data/Database/Enums/Getter/EnumGetter.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/GhostSpot/GhostSpot_Type.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/GhostScript/GhostScript.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/LevelScript/LevelScript.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseObject_Getter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/00_LoadingGameElements/Aura/LoadAura.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/00_LoadingGameElements/Effect/LoadEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/00_LoadingGameElements/Ghost/LoadingGhost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/00_LoadingGameElements/GhostSpot/LoadingGhostSpot.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/00_LoadingGameElements/Mortal/LoadingMortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/00_LoadingGameElements/Room/LoadingRoom.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Level/Subclasses/Exit/Haunting_Exit.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Level/Subclasses/Getter/FloorGetter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Getter/RoomGetter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Haunting_InteractiveObject.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/SubClasses/Stairs/Hauning_Stairs.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import '../Classes/Level/Haunting_Level.dart';

class LoadingGameElements{



  static Haunting_Level loadLevel(Haunting_Game game) {
    var world = Haunting_Level(levelName: game.levelName)
      ..script = game.script
      ..viewModel = game.viewModel;
    game.add(world);
    return world;
  }

  static void loadLevelObjects(Haunting_Level level, Haunting_Game game) {

    final spawnPointsLayer = level.level.tileMap.getLayer<ObjectGroup>('SpawnPoints');
    if(spawnPointsLayer != null){
      for(final spawnPoint in spawnPointsLayer.objects){
        switch(spawnPoint.class_){
          case 'Mortal': {
            LoadingMortal.loadMortal(spawnPoint, game);
            break;
          }
          case 'Effect': {
            LoadEffect.loadEffect(spawnPoint, game);
            break;
          }
          case 'Ghost': {
            LoadingGhostSpot.loadGhostSpot(spawnPoint, game);
            break;
          }
          case "Aura" : {
            LoadAura.loadAura(spawnPoint, game);
            break;
          }
          case "TrappedGhost" : {
            LoadingGhost.loadTrappedGhost(spawnPoint, game);
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
            // String pointName = point.name;
            // List<String> pointName_Parts = pointName.split('_');
            // int floorID_ByPoint = int.parse(pointName_Parts[1]);
            int floorID = point.properties.getValue('floor');
            //GET FLOOR BY POINT ID AND ADD POINT TO ITS LIST
            Haunting_Floor? floorByID = FloorGetter.getFloorById(floorID, game);
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

          case 'MortalSpecialPoint_Interactive' : {
            int floorID = point.properties.getValue('floor');
            String roomName = point.properties.getValue('roomName');
            String id = point.properties.getValue('id');
            String sound_Start = point.properties.getValue('sound_Start');
            String sound_End = point.properties.getValue('sound_End');
            double time = point.properties.getValue('time');
            bool isSeducing = point.properties.getValue('isSeducing');
            bool isPickUpObject = point.properties.getValue('isPickUpObject');
            String image = point.properties.getValue('image');

            String? imageValue;
            Haunting_Floor? floor = FloorGetter.getFloorById(floorID, game);
            Haunting_Room? room = RoomGetter.getRoomByName(roomName, game);

            if(image.isEmpty){
              imageValue = null;
            } else {
              imageValue = image;
            }
            if(floor != null && room != null){
              Haunting_InteractiveObject interactiveObject = Haunting_InteractiveObject(
                  position: point.position,
                  size: point.size,
                  floor: floor,
                  room: room,
                  id: id,
                  isPickUpObject: isPickUpObject,
                  image: imageValue,
                  sound_End: sound_End,
                  sound_Start: sound_Start,
                  time: time,
                  isSeducing: isSeducing
              );
              floor.listInteractiveObjects.add(interactiveObject);
              game.level.level.add(interactiveObject);
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
            String id = room.properties.getValue('id');
            int floorId = room.properties.getValue('floor');
            List<String> listOfAuras_String = LoadingRoom.getSeparatedAuras(auras_String);
            List<Aura> auras = LoadingRoom.getListOfAuras(listOfAuras_String);

            Haunting_Floor? floor = FloorGetter.getFloorById(floorId, game);
            if(floor != null){
              if (room.isPolygon) {
                final polygonPoints = room.polygon.map((p) {
                  return Vector2(room.x + p.x, room.y + p.y);
                }).toList();
                Haunting_Room haunting_room = Haunting_Room(
                  // position: room.position,
                    polygon: polygonPoints,
                    auras: auras,//spawnPoint.properties.getValue('offNeg');
                    // floorID: room.properties.getValue('floor'),
                    floor: floor,
                    id: id
                );
                level.rooms.add(haunting_room);
                level.level.add(haunting_room);
                floor.listRooms.add(haunting_room);
              }
            }
          }
        }
      }
    }
  }

  static void loadLevelFloors(Haunting_Level level, Haunting_Game game) {
    List<Haunting_Room> listOfRooms = game.level.rooms;
    int floorsCount = game.numberOfFloors;
    int basementFloorsCount = game.numberOfFloorsBasement;

    //CREATING FLOORS
    for(int i = 0; i < floorsCount; i++){
      //IF FLOOR WITH ID DOES NOT EXIST CREATE ONE
      if((level.floors.any((floor) => floor.id == i))){} else {
        print("nie ma floor o id ${i} -> tworzenie");
        Haunting_Floor floor = Haunting_Floor(id: i);
        level.floors.add(floor);
      }
    }
    //CREATING BASEMENT FLOORS
    for(int i = 1; i < basementFloorsCount + 1; i++){
      //IF FLOOR WITH ID DOES NOT EXIST CREATE ONE
      int floorID = 0 - i;
      if((level.floors.any((floor) => floor.id == floorID))){} else {
        print("nie ma floor o id ${floorID} -> tworzenie");
        Haunting_Floor floor = Haunting_Floor(id: floorID);
        level.floors.add(floor);
      }
    }

    // for(Haunting_Room room in listOfRooms){
    //   //IF FLOOR WITH ID DOES NOT EXIST CREATE ONE
    //   if((level.floors.any((floor) => floor.id == room.floorID))){} else {
    //     print("nie ma floor o id ${room.floorID} -> tworzenie");
    //     Haunting_Floor floor = Haunting_Floor(id: room.floorID);
    //     level.floors.add(floor);
    //   }
    //   //GET FLOOR BY ID AND ADD ROOM TO ITS LIST
    //   Haunting_Floor? floorByID = FloorGetter.getFloorById(room.floorID, game);
    //   if(floorByID != null){
    //     floorByID.listRooms.add(room);
    //     room.floor = floorByID;
    //   }
    // }

  }



}