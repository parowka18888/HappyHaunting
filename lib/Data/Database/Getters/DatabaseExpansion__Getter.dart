import 'package:happyhaunting/Data/Database/DatabaseStructure/11_Expansion.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseChapter_Getter.dart';

class DatabaseExpansion__Getter{
  static int getExpansionGhostsNumber(Expansion expansion) {
    int ghostsCount = 0;
    for(var chapter in expansion.chapters){
      ghostsCount += DatabaseChapter_Getter.getChapterGhostsNumber(chapter);
    }
    return ghostsCount;
  }

}