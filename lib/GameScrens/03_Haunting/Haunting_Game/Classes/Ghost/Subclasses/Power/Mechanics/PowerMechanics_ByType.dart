import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/Data/Database/Enums/Entry.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Entry/Haunting_Entry.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Mechanics/PowerMechanics.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Particles/PowerParticleGetter/PowerParticleGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Getter/FloorGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Setter_Power.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/MortalDestinationPoints/Getter/MortalDestinationPointsGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

import '../../../../Room/SubClasses/GhostSpot/Haunting_GhostSpot.dart';
import '../../../../Room/SubClasses/GhostSpot/Particle/GhostSpot_Particle.dart';
import '../Particles/PowerParticle.dart';
import 'DealingDamage.dart';

class PowerMechanics_ByType{
  // static void usePowerByType_MortalSingle(Haunting_Power power, Haunting_Room room, Haunting_Game game, Haunting_Ghost ghost) {
  //   if(room.mortalsInRoom.length > 0){
  //     List<Haunting_Mortal> listOfAvailableMortals = room.mortalsInRoom;
  //     listOfAvailableMortals.shuffle();
  //     Haunting_Mortal mortal = listOfAvailableMortals.first;
  //     List<double> damages = DealingDamage.dealInstantDamageToMortal(power, mortal);
  //     Haunting_Entry.addEntry_DealtDamage_PowerDealtDamage(game.viewModel, ghost, mortal, power, damages);
  //     PowerMechanics.setPowerCooldown(power, game);
  //     PowerParticle.travelParticles(Vector2(0, 0), PowerParticleGetter.getDestination(ghost.ghostSpot, mortal), ghost.ghostSpot!);
  //
  //   }
  // }

  // static void usePowerByType_MortalRoom(Haunting_Power power, Haunting_Room room, Haunting_Game game, Haunting_Ghost ghost) {
  //   if(room.mortalsInRoom.length > 0){
  //     List<Haunting_Mortal> mortals = room.mortalsInRoom;
  //     for(Haunting_Mortal mortal in mortals){
  //       List<double> damages = DealingDamage.dealInstantDamageToMortal(power, mortal);
  //       Haunting_Entry.addEntry_DealtDamage_PowerDealtDamage(game.viewModel, ghost, mortal, power, damages);
  //       PowerMechanics.setPowerCooldown(power, game);
  //       PowerParticle.travelParticles(Vector2(0, 0), PowerParticleGetter.getDestination(ghost.ghostSpot, mortal), ghost.ghostSpot!);
  //     }
  //   }
  // }
  //
  // static void usePowerByType_MortalGlobal(Haunting_Power power, Haunting_Room room, Haunting_Game game, Haunting_Ghost ghost) {
  //   List<Haunting_Mortal> mortals = game.level.mortals;
  //   for(Haunting_Mortal mortal in mortals){
  //     List<double> damages = DealingDamage.dealInstantDamageToMortal(power, mortal);
  //     Haunting_Entry.addEntry_DealtDamage_PowerDealtDamage(game.viewModel, ghost, mortal, power, damages);
  //     PowerMechanics.setPowerCooldown(power, game);
  //     PowerParticle.globalPower(Vector2(0, 0), ghost.ghostSpot!);
  //   }
  // }

  // static void usePowerByType_LureFloor(Haunting_Power power, Haunting_Room room, Haunting_Game game, Haunting_Ghost ghost) {
  //   Haunting_Floor? floor = room.floor;
  //   if(floor != null){
  //     List<Vector2> listOfMortalActionPointsInRoom = MortalDestinationPointsGetter.getDestinationPointsByRoom(room, floor.mortalActionPoints);
  //     if(listOfMortalActionPointsInRoom.isNotEmpty){
  //       for(final roomAtFloor in floor.listRooms){
  //         for(final mortal in roomAtFloor.mortalsInRoom){
  //           print("Mortal ${mortal.name} miał ${mortal.currentDestination}");
  //           Mortal_Destination_Setter_Power.setNextDestination_ByPower(mortal, game, listOfMortalActionPointsInRoom);
  //           print("Mortal ${mortal.name} ma ${mortal.currentDestination}");
  //         }
  //       }
  //       Haunting_Entry.addEntry_UsesPower(game.viewModel, ghost, power);
  //       PowerMechanics.setPowerCooldown(power, game);
  //       PowerParticle.globalPower(Vector2(0, 0), ghost.ghostSpot!);
  //     }
  //   }
  // }
  //
  // static void usePowerByType_LureMap(Haunting_Power power, Haunting_Room room, Haunting_Game game, Haunting_Ghost ghost) {
  //   //GET GHOST FLOOR, IF FLOOR EXISTS -> GET LIST OF AVAILABLE LURING POINTS
  //   Haunting_Floor? floor = room.floor;
  //   if(floor != null){
  //     List<Vector2> listOfMortalActionPointsInRoom = MortalDestinationPointsGetter.getDestinationPointsByRoom(room, floor.mortalActionPoints);
  //     //IF POINTS EXIST, DO FOR EVERY MORTAL ->
  //     if(listOfMortalActionPointsInRoom.isNotEmpty){
  //       //FOR EVERY MORTAL
  //       for(final mortal in game.level.mortals){
  //         Mortal_Destination_Setter_Power.setFinalDestination_ByPower(mortal, game, listOfMortalActionPointsInRoom, floor);
  //         Mortal_Destination_Setter_Power.setNextDestination_ByPower(mortal, game, listOfMortalActionPointsInRoom);
  //         print("Zadziałąło na ${mortal.name}");
  //       }
  //       Haunting_Entry.addEntry_UsesPower(game.viewModel, ghost, power);
  //       PowerMechanics.setPowerCooldown(power, game);
  //       PowerParticle.globalPower(Vector2(0, 0), ghost.ghostSpot!);
  //     }
  //   }
  // }

}