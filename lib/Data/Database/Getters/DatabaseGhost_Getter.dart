import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:hive/hive.dart';

class DatabaseGhost_Getter{
  static List<Ghost> getOwnedGhosts() {
    Box<Ghost> box_Ghosts = Hive.box<Ghost>('ghosts');
    final List<Ghost> ghosts = box_Ghosts.values
        .where((ghost) => ghost.isUnlocked == true)
        .toList();
    return ghosts;

  }

}