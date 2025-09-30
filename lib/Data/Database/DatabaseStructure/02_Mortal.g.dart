// GENERATED CODE - DO NOT MODIFY BY HAND

part of '02_Mortal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MortalAdapter extends TypeAdapter<Mortal> {
  @override
  final int typeId = 2;

  @override
  Mortal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mortal(
      id: fields[0] as String,
      name: fields[1] as String,
      stat_Fear: fields[2] as double,
      stat_Health: fields[3] as double,
      stat_Madness: fields[4] as double,
      stat_Faith: fields[5] as double,
      stat_Multiplier_Fear: fields[6] as double,
      stat_Multiplier_Health: fields[7] as double,
      stat_Multiplier_Madness: fields[8] as double,
      stat_Multiplier_Faith: fields[9] as double,
      type: fields[10] as String?,
      icon: fields[11] as String,
      mortalTags: (fields[12] as List).cast<MortalTag>(),
      exorcismStrength: fields[13] as double,
      fear: fields[14] as PowerTag,
    );
  }

  @override
  void write(BinaryWriter writer, Mortal obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.stat_Fear)
      ..writeByte(3)
      ..write(obj.stat_Health)
      ..writeByte(4)
      ..write(obj.stat_Madness)
      ..writeByte(5)
      ..write(obj.stat_Faith)
      ..writeByte(6)
      ..write(obj.stat_Multiplier_Fear)
      ..writeByte(7)
      ..write(obj.stat_Multiplier_Health)
      ..writeByte(8)
      ..write(obj.stat_Multiplier_Madness)
      ..writeByte(9)
      ..write(obj.stat_Multiplier_Faith)
      ..writeByte(10)
      ..write(obj.type)
      ..writeByte(11)
      ..write(obj.icon)
      ..writeByte(12)
      ..write(obj.mortalTags)
      ..writeByte(13)
      ..write(obj.exorcismStrength)
      ..writeByte(14)
      ..write(obj.fear);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MortalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mortal _$MortalFromJson(Map<String, dynamic> json) => Mortal(
      id: json['id'] as String,
      name: json['name'] as String,
      stat_Fear: (json['stat_Fear'] as num).toDouble(),
      stat_Health: (json['stat_Health'] as num).toDouble(),
      stat_Madness: (json['stat_Madness'] as num).toDouble(),
      stat_Faith: (json['stat_Faith'] as num).toDouble(),
      stat_Multiplier_Fear: (json['stat_Multiplier_Fear'] as num).toDouble(),
      stat_Multiplier_Health:
          (json['stat_Multiplier_Health'] as num).toDouble(),
      stat_Multiplier_Madness:
          (json['stat_Multiplier_Madness'] as num).toDouble(),
      stat_Multiplier_Faith: (json['stat_Multiplier_Faith'] as num).toDouble(),
      type: json['type'] as String?,
      icon: json['icon'] as String,
      mortalTags: (json['mortalTags'] as List<dynamic>)
          .map((e) => $enumDecode(_$MortalTagEnumMap, e))
          .toList(),
      exorcismStrength: (json['exorcismStrength'] as num).toDouble(),
      fear: $enumDecode(_$PowerTagEnumMap, json['fear']),
    );

Map<String, dynamic> _$MortalToJson(Mortal instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'stat_Fear': instance.stat_Fear,
      'stat_Health': instance.stat_Health,
      'stat_Madness': instance.stat_Madness,
      'stat_Faith': instance.stat_Faith,
      'stat_Multiplier_Fear': instance.stat_Multiplier_Fear,
      'stat_Multiplier_Health': instance.stat_Multiplier_Health,
      'stat_Multiplier_Madness': instance.stat_Multiplier_Madness,
      'stat_Multiplier_Faith': instance.stat_Multiplier_Faith,
      'type': instance.type,
      'icon': instance.icon,
      'mortalTags':
          instance.mortalTags.map((e) => _$MortalTagEnumMap[e]!).toList(),
      'exorcismStrength': instance.exorcismStrength,
      'fear': _$PowerTagEnumMap[instance.fear]!,
    };

const _$MortalTagEnumMap = {
  MortalTag.regular: 'regular',
  MortalTag.exorcist: 'exorcist',
};

const _$PowerTagEnumMap = {
  PowerTag.Null: 'Null',
  PowerTag.Noise: 'Noise',
  PowerTag.Blood: 'Blood',
  PowerTag.Insects: 'Insects',
  PowerTag.Water: 'Water',
};
