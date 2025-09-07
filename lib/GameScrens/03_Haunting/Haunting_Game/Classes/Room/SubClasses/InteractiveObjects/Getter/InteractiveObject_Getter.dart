import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Haunting_InteractiveObject.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class InteractiveObject_Getter{
  static Haunting_InteractiveObject? getInteractiveObject_ById(String id, Haunting_Game game, {
    Haunting_Floor? floor
  }) {
    for(final floor in game.level.floors){
      for(final object in floor.listInteractiveObjects){
        if(object.id == id){
          return object;
        }
      }
    }
    return null;
  }

  static Haunting_InteractiveObject? getRandomInteractiveObject_ByList(List<Haunting_InteractiveObject> list) {
    if(list.isNotEmpty){
      list.shuffle();
      return list[0];
    } else {
      return null;
    }
  }

}