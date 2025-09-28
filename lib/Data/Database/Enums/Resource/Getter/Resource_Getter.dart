import 'package:happyhaunting/Data/Database/Enums/Resource/Resource.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Getter/Statistic_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Statistic.dart';

class Resource_Getter{
  static String getResourceImage(Resource resource) {
    switch(resource){
      case Resource.gold:
        return 'Gold';
      case Resource.fear:
        return 'Essence_${Statistic_Getter.getStatisticColor(Statistic.fear)}';
      case Resource.health:
        return 'Essence_${Statistic_Getter.getStatisticColor(Statistic.health)}';
      case Resource.faith:
        return 'Essence_${Statistic_Getter.getStatisticColor(Statistic.faith)}';
      case Resource.madness:
        return 'Essence_${Statistic_Getter.getStatisticColor(Statistic.madness)}';
      case Resource.emotions:
        return 'Essence_${Statistic_Getter.getStatisticColor(Statistic.emotions)}';
      case Resource.impurity:
        return 'Essence_${Statistic_Getter.getStatisticColor(Statistic.impurity)}';
    }
  }

}