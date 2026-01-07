import 'dart:async';

import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Navigators/MortalEffect_Navigator.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Room/Haunting_Effect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/StaticData/Mortal_StaticData.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:hive/hive.dart';

import '../../../../../../Data/Database/DatabaseStructure/04_Aura.dart';
import '../../../../../../Data/Database/Getters/DatabaseObject_Getter.dart';
import '../../Ghost/Getter/GhostGetter.dart';
import '../../Ghost/Haunting_Ghost.dart';
import '../../Power/Mechanics/UsingPowers/ByType/Effect/PowersEffect.dart';

class RoomEffectsMechanics{

  static void addEffectToMortal(Haunting_Effect effect, Haunting_Mortal mortal,  {
    double? overwrittenTimeLeft,
  }) {
    if(!mortal.effects.any((element) => element.power == effect.power)){
      Haunting_MortalEffect mortalEffect = Haunting_MortalEffect(
          power: effect.power!,
          mortal: mortal
      )
        ..room = mortal.room
        ..timeLeft = overwrittenTimeLeft ?? effect.timeLeft - 1;
      effect.game.add(mortalEffect);
      mortal.effects.add(mortalEffect);
      MortalEffect_Navigator.navigateMortalEffect(mortalEffect);
    }
  }

  static void addEffectToMortalsInRoom(Haunting_Effect effect, Haunting_Room room,  {
    double? overwrittenTimeLeft,
  }) {
    for(Haunting_Mortal mortal in room.mortalsInRoom){
      addEffectToMortal(effect, mortal, overwrittenTimeLeft: overwrittenTimeLeft);
      // if(!mortal.effects.any((element) => element.power == effect.power)){
      //   Haunting_MortalEffect mortalEffect = Haunting_MortalEffect(
      //       power: effect.power!,
      //       mortal: mortal
      //   )
      //     ..room = room
      //     ..timeLeft = overwrittenTimeLeft ?? effect.timeLeft - 1;
      //   effect.game.add(mortalEffect);
      //   mortal.effects.add(mortalEffect);
      //   MortalEffect_Navigator.navigateMortalEffect(mortalEffect);
      // }
    }
  }

  static void addEffectToRoomsByAura(Haunting_Effect effect, String auraID){
      Box box_Auras = Hive.box<Aura>('auras');
      Aura? aura = DatabaseObject_Getter.getObjectById(auraID, box_Auras);
      if(aura != null && effect.power != null){
        List<Haunting_Room> rooms = effect.game.level.rooms.where((element) => element.auras.contains(aura)).toList();
        rooms.remove(effect.room);
        Haunting_Ghost? ghost = GhostGetter.getGhostByPower(effect.power!, effect.game);
        if(ghost != null){
          for(var chosenRoom in rooms){
            if(effect.executionHelper == 0) PowersEffect.usePower_EffectRoom(effect.power!, ghost, chosenRoom, effect.game, skipAnimation: true, skipEndingProcess: true, executionHelper: 10);
          }
        }
      }
  }

}