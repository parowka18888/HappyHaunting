import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/01_Power.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/04_Aura.dart';
import 'package:hive/hive.dart';

import '../../../../Data/Database/DatabaseStructure/02_Mortal.dart';
import '../../../../Data/Database/DatabaseStructure/03_Level.dart';
import '../../../../Data/Database/Getters/DatabaseObject_Getter.dart';

class BoxType_Getter{

  static Box box_Ghosts = Hive.box<Ghost>('ghosts');
  static Box box_Powers = Hive.box<Power>('powers');
  static Box box_Mortals = Hive.box<Mortal>('mortals');
  static Box box_Auras = Hive.box<Aura>('auras');

  static getObjectData_ByBoxType(Box box, objectJson) {
    switch (box){
      case (Box<Ghost> _) : {
        var ghost = Ghost.fromJson(objectJson);
        return ghost;
        break;
      }
      case (Box<Power> _) : {
        return Power.fromJson(objectJson);
      }
      case (Box<Mortal> _) : {
        return Mortal.fromJson(objectJson);
      }
      case (Box<Level> _) : {
        // Level level = Level.fromJson(objectJson);

        // //GET MORTAL IDS
        // List<String> mortalsIDs = level.mortalsIDs;
        // List<Mortal> mortals = [];
        // List<String> mortalsIDs = level.mortalsIDs;
        // List<Mortal> mortals = [];
        //
        // for(String id in mortalsIDs){
        //   Mortal mortal = DatabaseObject_Getter.getObjectById(id, box_Mortals);
        //   mortals.add(mortal);
        // }

        // level.mortals = mortals;
        return Level.fromJson(objectJson);
      }
      case (Box<Aura> _) : {
        return Aura.fromJson(objectJson);
      }
    }
  }

  static getDetailedInformation_ByBoxType(Box box, String objectID) {
    switch (box){
      case (Box<Ghost> _) : {
        var ghost = DatabaseObject_Getter.getObjectById(objectID, box);
        if(ghost != null){
          List<Power> powers = [];
          List<Aura> auras = [];
          for(String id in ghost.powersIDs){
            Power power = DatabaseObject_Getter.getObjectById(id, box_Powers);
            powers.add(power);
          }
          for(String id in ghost.aurasIDs){
            print(id); print(box_Auras.length);
            Aura aura = DatabaseObject_Getter.getObjectById(id, box_Auras);
            auras.add(aura);
          }
          ghost.powers = powers;
          ghost.auras = auras;
          ghost.save();
          print("✅✅✅✅ Nadpisano dane ${ghost.id}");
        }
        break;
      }
      case (Box<Power> _) : {
        break;
      }
      case (Box<Mortal> _) : {
        break;
      }
      case (Box<Level> _) : {
        Level? level = DatabaseObject_Getter.getObjectById(objectID, box);
        if(level != null){
          List<String> mortalsIDs = level.mortalsIDs;
          List<Mortal> mortals = [];
          List<String> trappedGhostsIDs = level.trappedGhostsIDs;
          List<Ghost> trappedGhosts = [];

          for(String id in mortalsIDs){
            Mortal mortal = DatabaseObject_Getter.getObjectById(id, box_Mortals);
            mortals.add(mortal);
          }

          for(String id in trappedGhostsIDs){
            Ghost ghost = DatabaseObject_Getter.getObjectById(id, box_Ghosts);
            trappedGhosts.add(ghost);
          }
          level.mortals = mortals;
          level.trappedGhosts = trappedGhosts;

          level.save();
        }
      }
    }

  }

}