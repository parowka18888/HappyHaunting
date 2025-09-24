import 'package:happyhaunting/Data/Database/DatabaseStructure/01_Power.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Statistic.dart';

class Statistic_Getter{
  static String getStatisticImage(Statistic statistic) {
    switch(statistic){
      case Statistic.fear:
        return 'Fear';
      case Statistic.health:
        return 'Soul';
      case Statistic.madness:
        return 'Madness';
      case Statistic.faith:
        return 'Faith';
      case Statistic.impurity:
        return 'Impurity';
      case Statistic.emotions:
        return 'Balance';
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