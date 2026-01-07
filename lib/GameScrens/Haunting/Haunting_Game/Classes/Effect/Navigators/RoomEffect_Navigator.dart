import 'package:happyhaunting/Data/Database/Getters/DatabaseObject_Getter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mechanics/RoomEffectMechanics.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Room/Haunting_Effect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Getter/GhostGetter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Mechanics/Speed/SpeedModifying.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:hive/hive.dart';

import '../../../../../../Data/Database/DatabaseStructure/04_Aura.dart';
import '../../../../../../Data/Database/Enums/Haunting/Scripts/PowerScript/PowerScript.dart';
import '../../Mortal/Haunting_Mortal.dart';
import '../../Power/Haunting_Power.dart';
import '../../Power/Mechanics/DealingDamage/DealingDamage.dart';
import '../../Power/Mechanics/UsingPowers/ByType/Effect/PowersEffect.dart';
import '../Mechanics/PowerScriptMechanics.dart';

class RoomEffect_Navigator{



  static void navigateRoomEffect(Haunting_Effect effect) {
    PowerScript? script = effect.power?.script;
    Haunting_Power? power = effect.power;
    Haunting_Room? room = effect.room;

    if(script != null && power != null && room != null){
      switch (script){
        case PowerScript.damage:{
          DealingDamage.dealDamageToAllMortals(power, room.mortalsInRoom, effect.game);
          break;
        }
        case PowerScript.damage_ReducingMovement:
          {
          RoomEffectsMechanics.addEffectToMortalsInRoom(effect, room);
          break;
          }
        case PowerScript.damage_fireElementalBuff:
          {
            DealingDamage.dealDamageToAllMortals(power, room.mortalsInRoom, effect.game);
            Haunting_Ghost? ghost = GhostGetter.getGhostByPower(power, power.game);
            if(ghost != null) PowerScriptMechanics.fireElementalBuff(power, room.mortalsInRoom, ghost);
            break;
          }
        case PowerScript.damage_Moth_Darkness:
          {
            if(effect.executionHelper == 0) RoomEffectsMechanics.addEffectToRoomsByAura(effect, 'Aura_Inside');
            effect.executionHelper++;
            DealingDamage.dealDamageToAllMortals(power, room.mortalsInRoom, effect.game);
          }
        case PowerScript.damage_ClothesEater_BonApetit:
          {
            DealingDamage.dealDamageToAllMortals(power, room.mortalsInRoom, effect.game);
            RoomEffectsMechanics.addEffectToMortalsInRoom(effect, room, overwrittenTimeLeft: power.powerTime);
          }
        case PowerScript.damage_FlyBuff:
          {
            Haunting_Ghost? ghost = GhostGetter.getGhostByPower(power, power.game);
            if(ghost != null){
              PowerScriptMechanics.flyBuff(power, room.mortalsInRoom, ghost);
            }
            break;
          }
        //UNAVAILABLE FOR ROOM (FOR NOW)
        case PowerScript.damage_blockingMovement: break;
        case PowerScript.damage_Spark_ChainEffect: break;
        case PowerScript.damage_Whisperer_Intruder: break;

        case PowerScript.damage_Mirror_ExorcistsBuff: break;
        case PowerScript.damage_Mirror_3Powers: break;
        case PowerScript.damage_FlyBuff: break;
      }
    }
  }

}