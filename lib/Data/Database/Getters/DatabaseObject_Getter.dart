import 'package:happyhaunting/Data/Database/DatabaseStructure/02_Mortal.dart';
import 'package:hive/hive.dart';

class DatabaseObject_Getter{

  static getObjectById(String id, Box box) {
    print(box.length);
    for(int index = 0; index < box.length; index++){
      if(box.getAt(index).id == id){
        return box.getAt(index);
      }
    }
    return null;
  }

}