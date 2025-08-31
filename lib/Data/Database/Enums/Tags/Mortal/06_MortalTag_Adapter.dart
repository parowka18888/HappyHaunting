import 'package:happyhaunting/Data/Database/Enums/Tags/Mortal/06_MortalTag.dart';
import 'package:happyhaunting/Data/Database/Enums/Tags/Power/05_PowerTag.dart';
import 'package:hive/hive.dart';

class MortalTag_Adapter extends TypeAdapter<MortalTag> {
  @override
  final int typeId = 6;

  @override
  MortalTag read(BinaryReader reader) {
    final name = reader.readString();
    return MortalTag.values.firstWhere((e) => e.name == name);
  }

  @override
  void write(BinaryWriter writer, MortalTag obj) {
    writer.writeString(obj.name);
  }
}