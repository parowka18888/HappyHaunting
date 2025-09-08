import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/CheckConditions/MortalChecker.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/PickUp/Setter/PickUp_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Getter/InteractiveObject_Getter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Haunting_InteractiveObject.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class PickUp_Mechanics{
  static void pickUpItem(Haunting_Mortal mortal, Haunting_InteractiveObject object, Haunting_Game game) {
    //CHANGE OBJECT FOR MORTAL
    Mortal_Setter.setPickUp(mortal, object);

    //REMOVE INTERACTIVE OBJECT FROM ACTION POINTS
    // object.floor!.listInteractiveObjects.remove(object);

    //CHANGE INTERACTIVE OBJECT
    object.isPickedUp = true;
    object.position.x = game.width * 2;
    object.room = null;
    object.timeOfUse = 0;
  }

  static void leftPickUp(Haunting_Mortal mortal, Haunting_Game game) {
    if(mortal.pickUp != null && mortal.pickUp!.interactiveObject != null){
      Haunting_InteractiveObject? object = InteractiveObject_Getter.getInteractiveObject_ById(mortal.pickUp!.interactiveObject!.id, game);
      if(object != null && object.floor != null && mortal.floor != null && mortal.room != null){
        if(!MortalChecker.checkIfMortalIsCloseToTheStairs(mortal, game)){
          print("ZNALEZIONO!");
          // print(mortal.position);
          // print(object.position);
          object.floor!.listInteractiveObjects.remove(object);
          object.floor = mortal.floor;
          object.room = mortal.room;
          object.position.x = mortal.position.x;
          object.position.y = mortal.position.y;
          object.isPickedUp = false;
          // object.sprite = mortal.pickUp!.interactiveObject!.sprite;
          object.floor!.listInteractiveObjects.add(object);
          print("Piętro ${object.floor!.id}, pokój ${object.room!.id}");

          Mortal_Setter.setPickUp(mortal, null);
        }
      }
    }

  }

}