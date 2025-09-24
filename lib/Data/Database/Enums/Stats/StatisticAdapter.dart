import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/LevelScript/LevelScript.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Statistic.dart';
import 'package:happyhaunting/Data/Database/Enums/Tags/Mortal/06_MortalTag.dart';
import 'package:happyhaunting/Data/Database/Enums/Tags/Power/05_PowerTag.dart';
import 'package:hive/hive.dart';

class Statistic_Adapter extends TypeAdapter<Statistic> {
  @override
  final int typeId = 9;

  @override
  Statistic read(BinaryReader reader) {
    final name = reader.readString();
    return Statistic.values.firstWhere((e) => e.name == name);
  }

  @override
  void write(BinaryWriter writer, Statistic obj) {
    writer.writeString(obj.name);
  }
}