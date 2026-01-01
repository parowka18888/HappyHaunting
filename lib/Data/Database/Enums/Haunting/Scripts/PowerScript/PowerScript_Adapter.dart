import 'package:happyhaunting/Data/Database/Enums/Tags/Power/05_PowerTag.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/PowerScript/PowerType.dart';
import 'package:hive/hive.dart';

import 'PowerScript.dart';

class PowerScript_Adapter extends TypeAdapter<PowerScript> {
  @override
  final int typeId = 16;

  @override
  PowerScript read(BinaryReader reader) {
    final name = reader.readString();
    return PowerScript.values.firstWhere((e) => e.name == name);
  }

  @override
  void write(BinaryWriter writer, PowerScript obj) {
    writer.writeString(obj.name);
  }
}