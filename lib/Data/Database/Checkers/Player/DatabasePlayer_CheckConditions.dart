import 'package:happyhaunting/Data/Database/Enums/Resource/Resource.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabasePlayer_Getter.dart';
import 'package:hive/hive.dart';

import '../../DatabaseStructure/08_Player.dart';

class DatabasePlayer_CheckConditions{

  static bool checkIfPlayerCanAfford(int neededCount, Resource resource) {
      if(DatabasePlayer_Getter.getPlayerResourceCountByResource(resource) > neededCount) return true;
      return false;
  }

}