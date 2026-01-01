import 'package:happyhaunting/Data/Database/Enums/Tags/Power/05_PowerTag.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/PowerScript/PowerType.dart';
import 'package:hive/hive.dart';

class PowerType_Adapter extends TypeAdapter<PowerType> {
  @override
  final int typeId = 15;

  @override
  PowerType read(BinaryReader reader) {
    final name = reader.readString();
    return PowerType.values.firstWhere((e) => e.name == name);
  }

  @override
  void write(BinaryWriter writer, PowerType obj) {
    writer.writeString(obj.name);
  }
}