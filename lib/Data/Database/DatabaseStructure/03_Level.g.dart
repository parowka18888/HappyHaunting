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
      rate: fields[11] as int,
      seconds: fields[12] as int,
      isUnlocked: fields[13] as bool,
      isBeaten: fields[14] as bool,
      tileWidth: fields[15] as int,
      tileHeight: fields[18] as int,
      numberOfFloors: fields[16] as int,
      numberOfFloorsBasement: fields[17] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Level obj) {
    writer
      ..writeByte(19)
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
      ..write(obj.background)
      ..writeByte(11)
      ..write(obj.rate)
      ..writeByte(12)
      ..write(obj.seconds)
      ..writeByte(13)
      ..write(obj.isUnlocked)
      ..writeByte(14)
      ..write(obj.isBeaten)
      ..writeByte(16)
      ..write(obj.numberOfFloors)
      ..writeByte(17)
      ..write(obj.numberOfFloorsBasement)
      ..writeByte(15)
      ..write(obj.tileWidth)
      ..writeByte(18)
      ..write(obj.tileHeight);
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
      rate: (json['rate'] as num).toInt(),
      seconds: (json['seconds'] as num).toInt(),
      isUnlocked: json['isUnlocked'] as bool,
      isBeaten: json['isBeaten'] as bool,
      tileWidth: (json['tileWidth'] as num).toInt(),
      tileHeight: (json['tileHeight'] as num).toInt(),
      numberOfFloors: (json['numberOfFloors'] as num).toInt(),
      numberOfFloorsBasement: (json['numberOfFloorsBasement'] as num).toInt(),
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
      'rate': instance.rate,
      'seconds': instance.seconds,
      'isUnlocked': instance.isUnlocked,
      'isBeaten': instance.isBeaten,
      'numberOfFloors': instance.numberOfFloors,
      'numberOfFloorsBasement': instance.numberOfFloorsBasement,
      'tileWidth': instance.tileWidth,
      'tileHeight': instance.tileHeight,
    };

const _$LevelScriptEnumMap = {
  LevelScript.empty: 'empty',
  LevelScript.testScript_Level: 'testScript_Level',
};
