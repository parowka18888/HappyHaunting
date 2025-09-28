import 'package:happyhaunting/Data/Database/Enums/Resource/Resource.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseObject_Getter.dart';
import 'package:hive/hive.dart';

import '../DatabaseStructure/08_Player.dart';

class DatabasePlayer_Getter{
  static Box box_Players = Hive.box<Player>('players');

  static Player? getPlayer() {
    Player? player = box_Players.getAt(0);
    return player;
  }

  static int getPlayerResourceCountByResource(Resource resource) {
    Player? player = getPlayer();
    if(player != null){
      switch(resource){
        case Resource.gold:
          return player.owningGold;
        case Resource.fear:
          return player.owningEssence_Fear;
        case Resource.health:
          return player.owningEssence_Soul;
        case Resource.faith:
          return player.owningEssence_Faith;
        case Resource.madness:
          return player.owningEssence_Madness;
        case Resource.emotions:
          return player.owningEssence_Emotions;
        case Resource.impurity:
          return player.owningEssence_Impurity;
      }
    }
    return 0;

  }


}