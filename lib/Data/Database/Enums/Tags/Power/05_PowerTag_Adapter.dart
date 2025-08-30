import 'package:happyhaunting/Data/Database/Enums/Tags/Power/05_PowerTag.dart';
import 'package:hive/hive.dart';

class PowerTag_Adapter extends TypeAdapter<PowerTag> {
  @override
  final int typeId = 5;

  @override
  PowerTag read(BinaryReader reader) {
    final name = reader.readString();
    return PowerTag.values.firstWhere((e) => e.name == name);
  }

  @override
  void write(BinaryWriter writer, PowerTag obj) {
    writer.writeString(obj.name);
  }
}