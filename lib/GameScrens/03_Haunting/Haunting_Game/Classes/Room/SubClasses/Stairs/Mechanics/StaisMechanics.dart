import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Getter/FloorGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Navigator.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Movement/Mortal_Movement.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/Stairs/Getter/StairsGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/SubClasses/Stairs/Hauning_Stairs.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class StairsMechanics{
  static void changeFloorForMortal(Haunting_Mortal mortal, int floorModifier, Haunting_Game game) {
    if(mortal.floor != null){
      int destinedFloorID = mortal.floor!.id + floorModifier;
      Haunting_Floor? floor = FloorGetter.getFloorById(destinedFloorID, game);

      if(floor != null){
        Haunting_Stairs? destinationStairs = StairsGetter.getOppositeStairsByFloor(floor, floorModifier);
        if(destinationStairs != null){
          print("Mozna zmienić");
          Mortal_Setter.setCanChangeFloors(mortal, false);
          Mortal_Setter.setPosition(mortal, destinationStairs.position);
          Mortal_Setter.setFloor(mortal, floor);
          // Mortal_Movement.navigateMortal(mortal, game);
          Mortal_Destination_Navigator.setMortalNextDestination_Navigator(mortal, game);
          print("Zmieniono piętro. ${mortal.name} jest teraz na piętrze ${mortal.floor!.id} w pokoju X");
        }
      }
    }
  }

}