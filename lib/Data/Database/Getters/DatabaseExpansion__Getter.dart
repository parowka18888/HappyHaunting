import 'package:happyhaunting/Data/Database/DatabaseStructure/11_Expansion.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseChapter_Getter.dart';

class DatabaseExpansion__Getter{
  static int getExpansionGhostsNumber(Expansion expansion) {
    int ghostsCount = 0;
    for(var level in expansion.levels){
      ghostsCount += level.trappedGhosts.length;
    }
    return ghostsCount;
  }

}