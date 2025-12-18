import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/GhostSpot/GhostSpot_Type.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Mechanics/MixedClasses/RoomGhost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Scripts/LevelScripts/ScriptNavigator/Scripts_GhostBased.dart';

import '../../Haunting_Game.dart';
import 'Mechanics/GhostSpot_Mechanics.dart';

class Haunting_GhostSpot extends SpriteComponent with HasGameReference<Haunting_Game>, TapCallbacks{

    Haunting_GhostSpot({super.position, super.size, required this.id});

    String id = "";
    Haunting_Ghost? ghost;

    GhostSpot_Type type = GhostSpot_Type.room;

    @override
    Future<void> onLoad() async {
      debugMode = true;
      //IMAGE
      sprite = ghost == null ? await game.loadSprite('UI/EmptySlot.png') : await game.loadSprite('Ghosts/${ghost!.icon}.png');
      return super.onLoad();
    }

    @override
    Future<void> update(double dt) async {
      super.update(dt);
      sprite = ghost == null ? await game.loadSprite('UI/EmptySlot.png') : await game.loadSprite('Ghosts/${ghost!.icon}.png');
      // sprite = await game.loadSprite('UI/EmptySlot.png');

      if(type == GhostSpot_Type.trap && ghost != null && ghost!.script != null){
        if(ghost!.isScriptExecuted == false){
          Scripts_GhostBased.getScript_Navigator(ghost!, game);
        }
      }

    }

    @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    if(type != GhostSpot_Type.trap){
      GhostSpot_Mechanics.removeGhostFromGhostSpot(game, this);
    } else {
      game.viewModel.setDialogData(ghost?.hintText, true);
    }

  }



}