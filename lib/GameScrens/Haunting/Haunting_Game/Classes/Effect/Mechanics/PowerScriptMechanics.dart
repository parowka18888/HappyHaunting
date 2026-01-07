import 'package:happyhaunting/Data/Database/DatabaseStructure/01_Power.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseObject_Getter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mechanics/Helper/PowerScriptHelperMechanics.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Getter/PowerGetter.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Mechanics/DealingDamage/DealingDamage.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Mechanics/UsingPowers/Navigator/UsePower_Navigator.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:hive/hive.dart';

class PowerScriptMechanics{

  static Box<Power> box_Powers = Hive.box<Power>('powers');

  static void fireElementalBuff(Haunting_Power power, List<Haunting_Mortal> mortals, Haunting_Ghost ghost) {
    Haunting_Room? room = ghost.room;
    PowerScriptHelperMechanics.dealDamageAsBuff(room, 'EP0_FireElemental_03', power, mortals);
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

  static void mirror_3Powers(Haunting_Power power, Haunting_Mortal mortal, Haunting_Ghost ghost, ) {
    List<Haunting_Ghost> ghosts = List<Haunting_Ghost>.from(ghost.game.level.ghosts);
    ghosts.shuffle();
    Haunting_Ghost chosenGhost = ghosts[0];
    for(int i = 0; i <= 2; i++){
      Haunting_Power chosenGhost_Power = chosenGhost.powers[i];
      Haunting_Power newPower = Haunting_Power
        (id: chosenGhost_Power.id,
          name: chosenGhost_Power.name,
          description: chosenGhost_Power.description,
          icon: chosenGhost_Power.icon,
          cost: 0,
          cooldown: chosenGhost_Power.cooldown,
          powerType: chosenGhost_Power.powerType,
          stat_Fear: chosenGhost_Power.stat_Fear,
          stat_Health: chosenGhost_Power.stat_Health,
          stat_Madness: chosenGhost_Power.stat_Madness,
          stat_Faith: chosenGhost_Power.stat_Faith,
          stat_Emotions: chosenGhost_Power.stat_Emotions,
          stat_Impurity: chosenGhost_Power.stat_Impurity,
          powerChances: chosenGhost_Power.powerChances,
          isActivated: chosenGhost_Power.isActivated,
          isDeactivatingForbidden: chosenGhost_Power.isDeactivatingForbidden,
          powerTime: chosenGhost_Power.powerTime,
          powerTags: chosenGhost_Power.powerTags
      );
      UsePower_Navigator.usePower_WithNavigator(newPower, ghost, mortal.room!, mortal.game);
    }

  }

  static void flyBuff(Haunting_Power power, List<Haunting_Mortal> mortals, Haunting_Ghost ghost) {
    Haunting_Room? room = ghost.room;
    PowerScriptHelperMechanics.dealDamageAsBuff(room, 'EP0_Fly_03', power, mortals);
  }

}