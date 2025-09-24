import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Room/SubClasses/InteractiveObjects/Haunting_InteractiveObject.dart';

class InteractiveObject_Setter{
  static void setCanBeUsed(Haunting_InteractiveObject interactiveObject, bool bool) {
    interactiveObject.canBeUsed = bool;
  }

  static void setIsActive(Haunting_InteractiveObject object, bool bool) {
    object.isActive = bool;
  }



}