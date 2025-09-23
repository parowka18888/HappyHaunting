import 'package:happyhaunting/Data/Database/DatabaseStructure/01_Power.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Statistic.dart';

class Statistic_Getter{
  static String getStatisticImage(Statistic statistic) {
    switch(statistic){
      case Statistic.fear:
        return 'assets/images/UI/Icons/Fear.png';
      case Statistic.health:
        return 'assets/images/UI/Icons/Soul.png';
      case Statistic.madness:
        return 'assets/images/UI/Icons/Madness.png';
      case Statistic.faith:
        return 'assets/images/UI/Icons/Faith.png';
      case Statistic.impurity:
        return 'assets/images/UI/Icons/Impurity.png';
      case Statistic.emotions:
        return 'assets/images/UI/Icons/Balance.png';
    }
  }

  static double getPowerValue(Statistic statistic, Power power) {
    switch(statistic){
      case Statistic.fear:
        return power.stat_Fear;
      case Statistic.health:
        return power.stat_Health;
      case Statistic.madness:
        return power.stat_Madness;
      case Statistic.faith:
        return power.stat_Faith;
      case Statistic.impurity:
        return power.stat_Impurity;
      case Statistic.emotions:
        return power.stat_Emotions;
    }
  }

}