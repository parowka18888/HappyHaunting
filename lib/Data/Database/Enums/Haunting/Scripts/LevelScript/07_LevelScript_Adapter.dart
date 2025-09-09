import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/LevelScript/LevelScript.dart';
import 'package:happyhaunting/Data/Database/Enums/Tags/Mortal/06_MortalTag.dart';
import 'package:happyhaunting/Data/Database/Enums/Tags/Power/05_PowerTag.dart';
import 'package:hive/hive.dart';

class LevelScript_Adapter extends TypeAdapter<LevelScript> {
  @override
  final int typeId = 7;

  @override
  LevelScript read(BinaryReader reader) {
    final name = reader.readString();
    return LevelScript.values.firstWhere((e) => e.name == name);
  }

  @override
  void write(BinaryWriter writer, LevelScript obj) {
    writer.writeString(obj.name);
  }
}