import 'package:flame/components.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Getter/MortalGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/CheckDestination/Destination_Checker.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/PickUp/Mechanics/PickUp_Mechanics.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Haunting_InteractiveObject.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class InteractiveObject_CheckConditions{
  static bool checkIfObjectCanBeUsed(Haunting_InteractiveObject object, Haunting_Game game) {
    if(object.isInUse || object.isActive == false) return false;
    Vector2 object_Position = object.position;
    for(final room in object.floor!.listRooms){
      for(final mortal in room.mortalsInRoom){
        if(mortal.finalDestination != null && mortal.finalDestination == object_Position
          || mortal.currentDestination != null && mortal.currentDestination == object_Position
        ){
          return false;
        }
      }
    }
    return true;
  }

  static bool checkIfObjectIsInUse(Haunting_InteractiveObject object, Haunting_Game game) {
    for(final mortal in object.room!.mortalsInRoom){
      if(mortal.isDefeated == false){
        if(Destination_Checker.checkIfMortalReachedDestination_ByVector(mortal, object.position)){
          return true;
        }
      }
    }
    return false;
  }

  static bool checkIfItemCanBePickedUp(Haunting_InteractiveObject object, Haunting_Game game) {
      if(object.isPickUpObject == true && object.isPickedUp == false){
        if(object.timeOfUse >= 3){
          Haunting_Mortal? mortal = MortalGetter.getMortalByVector(game, object.position, room: object.room);
          if(mortal != null){
            if(mortal.pickUp != null){
              PickUp_Mechanics.pickUpItem(mortal, object, game);
              return true;
            }
          }
        }
      }
      return false;
  }

}