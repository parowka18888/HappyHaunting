import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Navigators/RoomEffect_Navigator.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';

import '../../../Haunting_Game.dart';
import '../../Power/Haunting_Power.dart';
import '../../Power/Mechanics/DealingDamage/DealingDamage.dart';

class Haunting_Effect extends SpriteComponent with HasGameReference<Haunting_Game>, TapCallbacks{

  Haunting_Effect({super.position, super.size, required this.index});

  int index;
  Haunting_Room? room;

  Haunting_Power? power;
  double timeLeft = 0;
  double timer = 1;

  late TextComponent timeLabel;

  @override
  Future<void> onLoad() async {
    // debugMode = true;
    //IMAGE
    sprite = power == null ? await game.loadSprite('UI/EmptySlot.png') : await game.loadSprite('Powers/${power!.icon}.png');

    final textPaint = TextPaint(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    );
    timeLabel = TextComponent(
      text: timeLeft.toStringAsFixed(1),
      textRenderer: textPaint,
      anchor: Anchor.center,
      position: size / 2,
    );
    // add(timeLabel);

    return super.onLoad();
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);
    if (power == null) {
      game.loadSprite('UI/EmptySlot.png').then((s) => sprite = s);
    } else {
      game.loadSprite('Powers/${power!.icon}.png').then((s) => sprite = s);

      //DO ACTIONS EVERY 1 SECOND
      //DECREASE TIMER SO IT CAN CALCULATE WHEN TO EXECUTE CODE
      timer -= dt;
      //IF IT IS TIME TO EXECUTE
      if(timer <= 0){
        //RELOAD TIMER
        timer = 1;

        //EXECUTE EFFECT
        RoomEffect_Navigator.navigateRoomEffect(this);

        //DECREASE EFFECT TIME
        timeLeft -= 1;
        //IT EFFECT IS NO LONGER AVAILABLE< REMOVE IT
        if(timeLeft <= 0){
          timeLeft = 0;
          power = null;
        }
      }
    }


    timeLabel.text = timeLeft.toStringAsFixed(1);

  }


}