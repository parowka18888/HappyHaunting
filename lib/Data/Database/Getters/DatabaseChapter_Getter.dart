import 'package:happyhaunting/Data/Database/DatabaseStructure/12_Chapter.dart';

class DatabaseChapter_Getter{
  static int getChapterGhostsNumber(Chapter chapter) {
    int ghostsCount = 0;
    for(var level in chapter.levels){
      print("DODAJE");
      ghostsCount += level.trappedGhosts.length;
    }
    return ghostsCount;
  }

}
