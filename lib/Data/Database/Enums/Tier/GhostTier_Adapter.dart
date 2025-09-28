import 'package:happyhaunting/Data/Database/Enums/Tags/Mortal/06_MortalTag.dart';
import 'package:happyhaunting/Data/Database/Enums/Tags/Power/05_PowerTag.dart';
import 'package:hive/hive.dart';

import 'GhostTier.dart';

class GhostTier_Adapter extends TypeAdapter<GhostTier> {
  @override
  final int typeId = 10;

  @override
  GhostTier read(BinaryReader reader) {
    final name = reader.readString();
    return GhostTier.values.firstWhere((e) => e.name == name);
  }

  @override
  void write(BinaryWriter writer, GhostTier obj) {
    writer.writeString(obj.name);
  }
}