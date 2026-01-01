import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Level/Haunting_Level.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';

class PowerGetter{

  static Haunting_Power? getPowerById(String id, Haunting_Level level) {
    for(var ghost in level.ghosts){
      for(var power in ghost.powers){
        if(power.id == id) {
          return power;
        }
      }
    }
    return null;
  }

}