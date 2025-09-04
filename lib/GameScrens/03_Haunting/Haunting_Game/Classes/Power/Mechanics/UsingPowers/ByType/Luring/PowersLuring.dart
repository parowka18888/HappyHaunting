import 'package:flame/components.dart';
import 'package:happyhaunting/Data/Database/Enums/Power_Targets.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Level/Subclasses/Haunting_Floor.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Navigator.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Room/Haunting_Room.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';
import '../../../../../Mortal/Haunting_Mortal.dart';
import '../../../../../Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Setter_Power.dart';
import '../../../../../Mortal/Mechanics/Setter/Mortal_Setter.dart';
import '../../../../../Room/SubClasses/InteractiveObjects/MortalDestinationPoints/Getter/MortalDestinationPointsGetter.dart';
import '../../../../Haunting_Power.dart';
import '../../../../Particles/PowerParticle.dart';
import '../../../PowerMechanics.dart';
import '../../Targets/TargetsGetter.dart';

class PowersLuring{
  static void usePower_Lure(Haunting_Power power, Haunting_Ghost ghost, Haunting_Room room, Haunting_Game game, Power_Targets targets) {
    List<Haunting_Mortal> listOfTargets = TargetsGetter.getPowerTargets(targets, room, game);
    Haunting_Floor? floor = room.floor;
    if(listOfTargets.isNotEmpty && floor != null){
      List<Vector2> listOfMortalActionPointsInRoom = MortalDestinationPointsGetter.getDestinationPointsByRoom(room, floor.mortalActionPoints);
      if(listOfMortalActionPointsInRoom.isNotEmpty){
        for(final roomAtFloor in floor.listRooms){
          for(final mortal in roomAtFloor.mortalsInRoom){
            if(mortal.isDefeated == false){
              Mortal_Destination_Setter_Power.setNextDestination_ByPower(mortal, game, listOfMortalActionPointsInRoom);
            }
          }
        }
        PowerMechanics.usePower_EndingProcess(game, power, ghost, room);
        PowerParticle.globalPower(Vector2(0, 0), ghost.ghostSpot!);
      }
    }
  }

  static void usePower_LureMap(Haunting_Power power, Haunting_Ghost ghost, Haunting_Room room, Haunting_Game game, Power_Targets targets) {
    List<Haunting_Mortal> listOfTargets = TargetsGetter.getPowerTargets(targets, room, game);
    Haunting_Floor? floor = room.floor;
    if(listOfTargets.isNotEmpty && floor != null){
      List<Vector2> listOfMortalActionPointsInRoom = MortalDestinationPointsGetter.getDestinationPointsByRoom(room, floor.mortalActionPoints);
      if(listOfMortalActionPointsInRoom.isNotEmpty){
        for(Haunting_Mortal mortal in listOfTargets){
          if(mortal.isDefeated == false){
            listOfMortalActionPointsInRoom.shuffle();
            Mortal_Setter.setFinalData(mortal, listOfMortalActionPointsInRoom[0], floor);
            Mortal_Destination_Navigator.setMortalNextDestination_Navigator(mortal, game);
          }
        }
        PowerMechanics.usePower_EndingProcess(game, power, ghost, room);
        PowerParticle.globalPower(Vector2(0, 0), ghost.ghostSpot!);
      }
    }
  }

}