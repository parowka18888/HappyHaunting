import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/LevelScript/LevelScript.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/MortalScript/MortalScript.dart';
import 'package:happyhaunting/Data/Database/Enums/Mortal_DefeatType.dart';
import 'package:happyhaunting/Data/Database/Enums/Mortal_State.dart';
import 'package:happyhaunting/Data/Database/Enums/PowerType.dart';
import 'package:happyhaunting/Data/Database/Enums/Tags/Mortal/06_MortalTag.dart';
import 'package:happyhaunting/Data/Database/Enums/Tags/Power/05_PowerTag.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/CheckConditions/MortalChecker.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Exorcism/Exorcism_Mechanics.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Getter/MortalGetter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Navigator.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Setter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Movement/Mortal_Movement.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/StaticData/Mortal_StaticData.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/PickUp/Mechanics/PickUp_Mechanics.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Mechanics/MixedClasses/RoomMortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Scripts/LevelScripts/ScriptNavigator/Scripts_MortalBased.dart';

import '../GhostSpot/Haunting_GhostSpot.dart';
import '../PickUp/Haunting_PickUp.dart';

// class Haunting_Mortal extends SpriteComponent {
class Haunting_Mortal extends SpriteComponent with HasGameReference<Haunting_Game>, TapCallbacks {

  Haunting_Mortal({
    super.position, super.size,
    required this.icon, required this.name, required this.fear,
    required this.stat_Fear, required this.stat_Health, required this.stat_Madness, required this.stat_Faith, required this.stat_Emotions, required this.stat_Impurity,
    required this.stat_Current_Fear, required this.stat_Current_Health, required this.stat_Current_Madness, required this.stat_Current_Faith,  required this.stat_Current_Emotions, required this.stat_Current_Impurity,
    required this.stat_Multiplier_Fear, required this.stat_Multiplier_Health, required this.stat_Multiplier_Madness, required this.stat_Multiplier_Faith, required this.stat_Multiplier_Emotions, required this.stat_Multiplier_Impurity,
    required this.floor, required this.id, required this.isActive, required this.script, required this.exorcismStrength, required this.tags

  });

  //STATIC DATA
  String icon = "";
  String name = "";
  String id = "";

  double exorcismStrength = 0;
  List<MortalTag> tags = [];

  //FEAR
  PowerTag fear = PowerTag.Null;
  bool isFearUnlocked = false;

  // ATTACHED OBJECTS
  Haunting_GhostSpot? ghostSpot;
  Haunting_PickUp? pickUp;

  //MORTAL VISIBILITY
  bool isActive = true;
  bool isActive_Helper = true; //WHEN VALUE isActive changes, SOME ACTIONS CAN BE HOLD

  List<Haunting_MortalEffect> effects = [];

  //MORTAL SCRIPTS
  MortalScript? script;
  List<int> conditionsMet = []; //LIST FOR CHECKING WHICH CONDITION IS MET
  bool isScriptExecuted = false;

  //SCARING MORTAL
  bool isDefeated = false;
  bool isEscaped = false;
  Mortal_DefeatType? defeatType;
  Mortal_State state = Mortal_State.calm;
  bool canMove = true;
  double timeOfThinking = 0;

  double stat_Fear = 0;
  double stat_Health = 0;
  double stat_Madness = 0;
  double stat_Faith = 0;
  double stat_Impurity = 0;
  double stat_Emotions = 0;

  double stat_Current_Fear = 0;
  double stat_Current_Health = 0;
  double stat_Current_Madness = 0;
  double stat_Current_Faith = 0;
  double stat_Current_Impurity = 0;
  double stat_Current_Emotions = 0;

  double stat_Multiplier_Fear = 0;
  double stat_Multiplier_Health = 0;
  double stat_Multiplier_Madness = 0;
  double stat_Multiplier_Faith = 0;
  double stat_Multiplier_Impurity = 0;
  double stat_Multiplier_Emotions = 0;

  Haunting_Floor? floor;
  Haunting_Room? room;

  bool canChangeFloor = true;


  //TIME FOR SLOWING DOWN SOME METHODS
  double timeSinceLastReload = 0.0;
  double refreshTime = 0.5;

  //LURING / ESCAPING DESTINATION
  Vector2? finalDestination;
  Haunting_Floor? finalFloor;




  Vector2? currentDestination;
  List<Vector2> path = [];

  double speed = 50;

  @override
  Future<void> onLoad() async {
    // debugMode = true;

    isActive_Helper = isActive;

    //IMAGE
    sprite = isActive == true ? await game.loadSprite('Mortals/$icon.png') : await game.loadSprite('UI/EmptySlot.png');

    //CHANGING BOX
    add(RectangleHitbox(
        position: Vector2(this.width * 0.25, this.height * 0.25),
        size: Vector2(this.width * 0.5, this.height * 0.5)
    ));

    speed = Mortal_StaticData.getMortalSpeedByState(state, game);

    Mortal_Destination_Navigator.setMortalNextDestination_Navigator(this, game);

    // final baseSprite = SpriteComponent(      sprite: await game.loadSprite('mortals/base.png'),      size: Vector2(64, 64),    );
    // // Nakładka (np. kapelusz, aura, itp.)
    // final overlaySprite = SpriteComponent(      sprite: await game.loadSprite('mortals/overlay.png'),      size: Vector2(64, 64),    );
    // add(baseSprite);    add(overlaySprite);

    return super.onLoad();
  }

  // @override
  // void onTapDown(TapDownEvent event) {
  //   Mortal_Setter.setIsActive(this, !isActive);
  //   super.onTapDown(event);
  // }

  @override
  void update(double dt) {

    super.update(dt);
    //IF MORTAL IS ACTIVE (IN REACH OF PLAYER)
    if(isActive == true){
      //DECREASING TIME OF THINKING (MORTAL FREEZE)
      if(timeOfThinking > 0){
        timeOfThinking -= dt;
        if(timeOfThinking <= 0){
          Mortal_Setter.setTimeOfThinking(this, 0, canMove: true);
        }
      }

      //IF MORTAL CAN MOVE, LET THEM MOVE
      if(canMove == true) Mortal_Movement.moveInPath(this, game, dt);

      //TIMER FOR SLOWING DOWN CERTAIN ACTIONS
        //REFRESH TIME STAMP FOR EXECUTING CODE
      timeSinceLastReload += dt;
      if (timeSinceLastReload >= refreshTime) {
        //CHECK WHERE ON THE MAP IS MORTAL, AND ASSIGN THEM TO CERTAIN ROOM
        RoomMortal.assignMortalToRoom(this, game);

        //EXORCISM SYSTEM - DEALING DAMAGE
        if(MortalChecker.checkIfMortalIsExorcist(this)){
          Exorcism_Mechanics.exorcismNavigator(this, game, 0.5, game.viewModel);
        }

        //PUT PICKUP OBJECT WHEN MORTAL IS DEFEATED
        if(isDefeated == true && isEscaped == false){
          PickUp_Mechanics.leftPickUp(this, game);
        }


        timeSinceLastReload = 0.0;

      }
    }

    if(script != null && isScriptExecuted == false){
      Scripts_MortalBased.getScript_Navigator(this, game);
    }


    //EXECUTE CODE WHEN isActive VALUE CHANGES
    if(isActive != isActive_Helper){
      isActive_Helper = isActive;
      Mortal_Setter.setIsActiveData(this, game);
      game.viewModel.refresh();
    }

  }



}