// GENERATED CODE - DO NOT MODIFY BY HAND

part of '03_Level.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LevelAdapter extends TypeAdapter<Level> {
  @override
  final int typeId = 3;

  @override
  Level read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Level(
      id: fields[0] as String,
      name: fields[1] as String,
      fileName: fields[2] as String,
      mortalsIDs: (fields[3] as List).cast<String>(),
      mortals: (fields[4] as List).cast<Mortal>(),
      levelWidth: fields[5] as double,
      levelHeight: fields[6] as double,
      trappedGhostsIDs: (fields[7] as List).cast<String>(),
      trappedGhosts: (fields[8] as List).cast<Ghost>(),
    );
  }

  @override
  void write(BinaryWriter writer, Level obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.fileName)
      ..writeByte(3)
      ..write(obj.mortalsIDs)
      ..writeByte(4)
      ..write(obj.mortals)
      ..writeByte(5)
      ..write(obj.levelWidth)
      ..writeByte(6)
      ..write(obj.levelHeight)
      ..writeByte(7)
      ..write(obj.trappedGhostsIDs)
      ..writeByte(8)
      ..write(obj.trappedGhosts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level _$LevelFromJson(Map<String, dynamic> json) => Level(
      id: json['id'] as String,
      name: json['name'] as String,
      fileName: json['fileName'] as String,
      mortalsIDs: (json['mortalsIDs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      mortals: (json['mortals'] as List<dynamic>)
          .map((e) => Mortal.fromJson(e as Map<String, dynamic>))
          .toList(),
      levelWidth: (json['levelWidth'] as num).toDouble(),
      levelHeight: (json['levelHeight'] as num).toDouble(),
      trappedGhostsIDs: (json['trappedGhostsIDs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      trappedGhosts: (json['trappedGhosts'] as List<dynamic>)
          .map((e) => Ghost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LevelToJson(Level instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fileName': instance.fileName,
      'mortalsIDs': instance.mortalsIDs,
      'mortals': instance.mortals,
      'levelWidth': instance.levelWidth,
      'levelHeight': instance.levelHeight,
      'trappedGhostsIDs': instance.trappedGhostsIDs,
      'trappedGhosts': instance.trappedGhosts,
    };
