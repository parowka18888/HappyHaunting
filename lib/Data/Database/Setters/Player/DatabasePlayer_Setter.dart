import 'package:happyhaunting/Data/Database/DatabaseStructure/08_Player.dart';
import 'package:happyhaunting/Data/Database/Enums/Resource/Resource.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabasePlayer_Getter.dart';
import 'package:hive/hive.dart';

class DatabasePlayer_Setter{


  static void cheatResources() {
    addGold(200);
    addEssences(1);

  }

  static void addGold(int value) {
    Player? player = DatabasePlayer_Getter.getPlayer();
    if(player != null){
      player.owningGold += value;
      player.save();
    }
  }

  static void addEssences(int value) {
    Player? player = DatabasePlayer_Getter.getPlayer();
    if(player != null){
      player.owningEssence_Soul += value;
      player.owningEssence_Emotions += value;
      player.owningEssence_Madness += value;
      player.owningEssence_Faith += value;
      player.owningEssence_Fear += value;
      player.owningEssence_Impurity += value;
      player.save();
    }
  }

  static void setResourceNumber(Resource resource, int newValue) {
    Player? player = DatabasePlayer_Getter.getPlayer();
    if(player != null){
      switch(resource){
        case Resource.gold:
         player.owningGold = newValue;
         break;
        case Resource.fear:
          player.owningEssence_Fear = newValue;
          break;
        case Resource.health:
          player.owningEssence_Soul = newValue;
          break;
        case Resource.faith:
          player.owningEssence_Faith = newValue;
          break;
        case Resource.madness:
          player.owningEssence_Madness = newValue;
          break;
        case Resource.emotions:
          player.owningEssence_Emotions = newValue;
          break;
        case Resource.impurity:
          player.owningEssence_Impurity = newValue;
          break;
      }
    }
  }

}