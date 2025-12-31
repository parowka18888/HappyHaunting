import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Haunting_MortalEffect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Room/Haunting_Effect.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/StaticData/Mortal_StaticData.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

class RoomEffectsMechanics{

  static void reduceMortalSpeedInRoom(Haunting_Effect effect, List<Haunting_Mortal> mortalsInRoom, Haunting_Game game, int speedReductionInPercents, Haunting_Room room) {
    for(Haunting_Mortal mortal in mortalsInRoom){
      bool mortalHasEffectAlready = false;
      for(Haunting_MortalEffect mortalEffect in mortal.effects){
        if(mortalEffect.power == effect.power){
          mortalHasEffectAlready = true;
          break;
        }
      }
      if(mortalHasEffectAlready == false){
        mortal.effects.add(Haunting_MortalEffect(power: effect.power!, mortal: mortal)..timeLeft = effect.timeLeft..room = room);
      }
      // if(effect.timeLeft <= 1){
      //   mortal.speed = Mortal_StaticData.getMortalSpeedByState(mortal.state, game);
      // } else {
      //   print("${Mortal_StaticData.getMortalSpeedByState(mortal.state, game)} / (0 / ${speedReductionInPercents} = ${Mortal_StaticData.getMortalSpeedByState(mortal.state, game) / (100 - speedReductionInPercents)})");
      //   mortal.speed = Mortal_StaticData.getMortalSpeedByState(mortal.state, game) * (1 -(speedReductionInPercents / 100));
      // }
    }
  }

}