import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/04_Aura.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/11_Expansion.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/12_Chapter.dart';
import 'package:happyhaunting/GameScrens/InitScreen/Mechanics/Getter/BoxType_Getter.dart';
import 'package:hive/hive.dart';

import '../../../../Data/Database/DatabaseStructure/00_Ghost.dart';
import '../../../../Data/Database/DatabaseStructure/01_Power.dart';
import '../../../../Data/Database/DatabaseStructure/02_Mortal.dart';
import '../../../../Data/Database/DatabaseStructure/03_Level.dart';
import '../../../../Data/Database/DatabaseStructure/08_Player.dart';

class AddingData{


  static Future<void> loadData() async {
    Box box_Ghosts = Hive.box<Ghost>('ghosts');
    Box box_Powers = Hive.box<Power>('powers');
    Box box_Mortals = Hive.box<Mortal>('mortals');
    Box box_Levels = Hive.box<Level>('levels');
    Box box_Auras = Hive.box<Aura>('auras');
    Box box_Chapters = Hive.box<Chapter>('chapters');
    Box box_Expansions = Hive.box<Expansion>('expansions');

    bool dataIsLoaded = true;
    int number_Ghosts = 2;
    int number_Powers = 1;

    await AddingData.addDataToDatabase_FromJSON(box_Powers, 'powers');
    await AddingData.addDataToDatabase_FromJSON(box_Auras, 'auras');
    await AddingData.addDataToDatabase_FromJSON(box_Ghosts, 'ghosts');
    await AddingData.addDataToDatabase_FromJSON(box_Mortals, 'mortals');
    await AddingData.addDataToDatabase_FromJSON(box_Levels, 'levels');
    await AddingData.addDataToDatabase_FromJSON(box_Chapters, 'chapters');
    await AddingData.addDataToDatabase_FromJSON(box_Expansions, 'expansions');

  }

  static Future<void> addDataToDatabase_FromJSON(Box box, String jsonName) async {

    final indexStr = await rootBundle.loadString('assets/data/Index.json');
    final indexJson = json.decode(indexStr);
    final objectsPaths = List<String>.from(indexJson['$jsonName']);

    for (final path in objectsPaths) {
      final data = await rootBundle.loadString(path);
      final objectJson = json.decode(data);
      final object = BoxType_Getter.getObjectData_ByBoxType(box, objectJson);
      if (!box.containsKey(object.id)) {
        await box.put(object.id, object);
        print("✅ Dodano nowy rekord: ${object.id}");
        print("⏩ Uzupełnianie Danych: ${object.id}");
        BoxType_Getter.getDetailedInformation_ByBoxType(box, object.id);

      } else {
        print("⏩ Rekord już istnieje: ${object.id}");
      }
    }
    print("Liczba elementów w boxie ${box.length}");
  }

  static void addPlayer() {
    Box box_Players = Hive.box<Player>('players');
    if(box_Players.isEmpty){
      Player player = Player();
      box_Players.add(player);
    }
  }

}