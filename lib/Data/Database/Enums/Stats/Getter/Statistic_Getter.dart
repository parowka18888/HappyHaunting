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

  static getStatisticBackground(Statistic statistic) {
    switch(statistic){
      case Statistic.fear:
        return 'SquareButton_Red';
      case Statistic.health:
        return 'SquareButton_Blue';
      case Statistic.madness:
        return 'SquareButton_Yellow';
      case Statistic.faith:
        return 'SquareButton_Purple';
      case Statistic.impurity:
        return 'SquareButton_Green';
      case Statistic.emotions:
        return 'SquareButton_Pink';
    }
  }

  static getGhostTypeNameByStatistic(Statistic statistic) {
    switch(statistic){
      case Statistic.fear:
        return 'Upiór';
      case Statistic.health:
        return 'Mara';
      case Statistic.madness:
        return 'Zmrocze';
      case Statistic.faith:
        return 'Widmo';
      case Statistic.impurity:
        return 'Plaga';
      case Statistic.emotions:
        return 'Gremlin';
    }
  }

  static getStatisticColor(Statistic statistic) {
    switch(statistic){
      case Statistic.fear:
        return 'Red';
      case Statistic.health:
        return 'Blue';
      case Statistic.madness:
        return 'Yellow';
      case Statistic.faith:
        return 'Purple';
      case Statistic.impurity:
        return 'Green';
      case Statistic.emotions:
        return 'Pink';
    }
  }

}