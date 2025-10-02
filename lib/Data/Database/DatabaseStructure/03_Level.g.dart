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
      mortals: (fields[3] as List).cast<Mortal>(),
      levelWidth: fields[4] as double,
      levelHeight: fields[5] as double,
      trappedGhosts: (fields[6] as List).cast<Ghost>(),
      startingText: fields[7] as String,
      script: fields[8] as LevelScript,
      icon: fields[9] as String,
      background: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Level obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.fileName)
      ..writeByte(3)
      ..write(obj.mortals)
      ..writeByte(4)
      ..write(obj.levelWidth)
      ..writeByte(5)
      ..write(obj.levelHeight)
      ..writeByte(6)
      ..write(obj.trappedGhosts)
      ..writeByte(7)
      ..write(obj.startingText)
      ..writeByte(8)
      ..write(obj.script)
      ..writeByte(9)
      ..write(obj.icon)
      ..writeByte(10)
      ..write(obj.background);
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
      mortals: const MortalListConverter().fromJson(json['mortals'] as List),
      levelWidth: (json['levelWidth'] as num).toDouble(),
      levelHeight: (json['levelHeight'] as num).toDouble(),
      trappedGhosts:
          const GhostListConverter().fromJson(json['trappedGhosts'] as List),
      startingText: json['startingText'] as String,
      script: $enumDecode(_$LevelScriptEnumMap, json['script']),
      icon: json['icon'] as String,
      background: json['background'] as String,
    );

Map<String, dynamic> _$LevelToJson(Level instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fileName': instance.fileName,
      'mortals': const MortalListConverter().toJson(instance.mortals),
      'levelWidth': instance.levelWidth,
      'levelHeight': instance.levelHeight,
      'trappedGhosts':
          const GhostListConverter().toJson(instance.trappedGhosts),
      'startingText': instance.startingText,
      'script': _$LevelScriptEnumMap[instance.script]!,
      'icon': instance.icon,
      'background': instance.background,
    };

const _$LevelScriptEnumMap = {
  LevelScript.empty: 'empty',
  LevelScript.testScript_Level: 'testScript_Level',
};
