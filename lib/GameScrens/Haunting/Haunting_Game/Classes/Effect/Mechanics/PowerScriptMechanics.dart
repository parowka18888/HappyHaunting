import 'package:happyhaunting/Data/Database/DatabaseStructure/01_Power.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseObject_Getter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Getter/PowerGetter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Mechanics/DealingDamage/DealingDamage.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:hive/hive.dart';

class PowerScriptMechanics{

  static Box<Power> box_Powers = Hive.box<Power>('powers');

  static void fireElementalBuff(Haunting_Power power, List<Haunting_Mortal> mortals, Haunting_Ghost ghost) {
    Haunting_Room? room = ghost.room;
    if(room != null){
      Haunting_Power? neededPower = PowerGetter.getPowerById('EP0_FireElemental_03', power.game.level);
      if(neededPower != null) {
        for(var effect in room.effects){
          if(effect.power != null){
            if(effect.power!.id == neededPower.id){
              double buff = (effect.power!.powerChances) / 100;
              DealingDamage.dealDamageToAllMortals(power, mortals, power.game, buffModifier: buff);
            }
          }
        }
      }

    }
  }

  static void spark_ChainEffect(Haunting_Power power, Haunting_Mortal mortal, Haunting_MortalEffect? effect) {
    if(mortal.effects.any((effect) => effect.power.id ==  'EP0_Spark_04')){
      if(effect == null || effect.timeLeft <= 1){
        Haunting_Room? room = mortal.room;
        if(room != null) {
          double modifier = ((power.powerChances / 100)) * power.powerTime;
          DealingDamage.dealDamageToAllMortals(power, room.mortalsInRoom, power.game, buffModifier: modifier);
        }
      }
    }

  }

}