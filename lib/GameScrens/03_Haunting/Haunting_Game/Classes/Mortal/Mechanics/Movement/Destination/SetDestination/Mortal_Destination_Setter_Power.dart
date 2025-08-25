import 'package:flame/components.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Movement/Destination/SetDestination/Mortal_Destination_Setter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Mechanics/Setter/Mortal_Setter.dart';

import '../../../../../../Haunting_Game.dart';
import '../../../../../Level/Subclasses/Haunting_Floor.dart';
import '../../../../Haunting_Mortal.dart';
import '../GetDestination/Mortal_Destination_Getter.dart';

class Mortal_Destination_Setter_Power{

  static void setNextDestination_ByPower(Haunting_Mortal mortal, Haunting_Game game, List<Vector2> listOfActionPoints) {
    Mortal_Setter.setCurrentDestination(mortal, Mortal_Destination_Getter.getNextDestination(listOfActionPoints));
    // mortal.currentDestination = Mortal_Destination.getNextDestination(listOfActionPoints);
    Mortal_Destination_Setter.setNextDestinationPath(mortal, game);
  }
  static void setFinalDestination_ByPower(Haunting_Mortal mortal, Haunting_Game game, List<Vector2> listOfActionPoints, Haunting_Floor floor) {
    Mortal_Setter.setFinalData(mortal, Mortal_Destination_Getter.getNextDestination(listOfActionPoints), floor);
    Mortal_Destination_Setter.forceNextDestination(mortal, game, null);
    print("mortal ${mortal.name} nowa destynacja ${mortal.currentDestination}");
  }

}