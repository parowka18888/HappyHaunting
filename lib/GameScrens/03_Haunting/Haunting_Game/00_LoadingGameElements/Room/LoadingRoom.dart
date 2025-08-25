import 'package:happyhaunting/Data/Database/DatabaseStructure/04_Aura.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabaseObject_Getter.dart';
import 'package:hive/hive.dart';

class LoadingRoom{
  static List<String> getSeparatedAuras(String list) {
    List<String> auras = list.split(',');
    return auras;
  }

  static List<Aura> getListOfAuras(List<String> listOfAuras_String) {
    Box box_Auras = Hive.box<Aura>('auras');
    List<Aura> auras = [];
    if(listOfAuras_String.length > 0){
      for(String auraId in listOfAuras_String){
        print(auraId);
        Aura? aura = DatabaseObject_Getter.getObjectById(auraId, box_Auras);
        if(aura != null){
          auras.add(aura);
        }
      }
    }
    return auras;
  }

}