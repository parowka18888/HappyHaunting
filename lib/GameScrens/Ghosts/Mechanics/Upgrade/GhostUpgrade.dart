import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/Enums/Resource/Resource.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/Getter/UpgradePrice_Getter.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabasePlayer_Getter.dart';
import 'package:happyhaunting/Data/Database/Setters/Player/DatabasePlayer_Setter.dart';

import '../../../../Data/Database/Setters/Ghost/DatabaseGhost_Setter.dart';

class GhostUpgrade{
  static void upgradeGhost(Ghost ghost) {
    List<Resource> listOfResources = Resource.values;
    for(var resource in listOfResources){
      int currentCount = DatabasePlayer_Getter.getPlayerResourceCountByResource(resource);
      int priceToPay = UpgradePrice_Getter.getUpgradePrice(resource, ghost);
      int newValue = currentCount - priceToPay;
      DatabasePlayer_Setter.setResourceNumber(resource, newValue);
    }
    DatabaseGhost_Setter.upgradeGhost(ghost);
  }

}