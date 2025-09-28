// GENERATED CODE - DO NOT MODIFY BY HAND

part of '01_Power.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PowerAdapter extends TypeAdapter<Power> {
  @override
  final int typeId = 1;

  @override
  Power read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Power(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      stat_Fear: fields[3] as double,
      stat_Health: fields[4] as double,
      stat_Madness: fields[5] as double,
      stat_Faith: fields[6] as double,
      cost: fields[7] as double,
      cooldown: fields[8] as double,
      icon: fields[9] as String,
      powerType: fields[10] as String,
      powerChances: fields[11] as double,
      powerTime: fields[12] as double,
      powerTagsIDs: (fields[13] as List).cast<String>(),
      powerTags: (fields[14] as List).cast<PowerTag>(),
      stat_Emotions: fields[16] as double,
      stat_Impurity: fields[15] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Power obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.stat_Fear)
      ..writeByte(4)
      ..write(obj.stat_Health)
      ..writeByte(5)
      ..write(obj.stat_Madness)
      ..writeByte(6)
      ..write(obj.stat_Faith)
      ..writeByte(15)
      ..write(obj.stat_Impurity)
      ..writeByte(16)
      ..write(obj.stat_Emotions)
      ..writeByte(7)
      ..write(obj.cost)
      ..writeByte(8)
      ..write(obj.cooldown)
      ..writeByte(9)
      ..write(obj.icon)
      ..writeByte(10)
      ..write(obj.powerType)
      ..writeByte(11)
      ..write(obj.powerChances)
      ..writeByte(12)
      ..write(obj.powerTime)
      ..writeByte(13)
      ..write(obj.powerTagsIDs)
      ..writeByte(14)
      ..write(obj.powerTags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PowerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Power _$PowerFromJson(Map<String, dynamic> json) => Power(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      stat_Fear: (json['stat_Fear'] as num).toDouble(),
      stat_Health: (json['stat_Health'] as num).toDouble(),
      stat_Madness: (json['stat_Madness'] as num).toDouble(),
      stat_Faith: (json['stat_Faith'] as num).toDouble(),
      cost: (json['cost'] as num).toDouble(),
      cooldown: (json['cooldown'] as num).toDouble(),
      icon: json['icon'] as String,
      powerType: json['powerType'] as String,
      powerChances: (json['powerChances'] as num).toDouble(),
      powerTime: (json['powerTime'] as num).toDouble(),
      powerTagsIDs: (json['powerTagsIDs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      powerTags: (json['powerTags'] as List<dynamic>)
          .map((e) => $enumDecode(_$PowerTagEnumMap, e))
          .toList(),
      stat_Emotions: (json['stat_Emotions'] as num).toDouble(),
      stat_Impurity: (json['stat_Impurity'] as num).toDouble(),
    );

Map<String, dynamic> _$PowerToJson(Power instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'stat_Fear': instance.stat_Fear,
      'stat_Health': instance.stat_Health,
      'stat_Madness': instance.stat_Madness,
      'stat_Faith': instance.stat_Faith,
      'stat_Impurity': instance.stat_Impurity,
      'stat_Emotions': instance.stat_Emotions,
      'cost': instance.cost,
      'cooldown': instance.cooldown,
      'icon': instance.icon,
      'powerType': instance.powerType,
      'powerChances': instance.powerChances,
      'powerTime': instance.powerTime,
      'powerTagsIDs': instance.powerTagsIDs,
      'powerTags':
          instance.powerTags.map((e) => _$PowerTagEnumMap[e]!).toList(),
    };

const _$PowerTagEnumMap = {
  PowerTag.Null: 'Null',
  PowerTag.Noise: 'Noise',
  PowerTag.Blood: 'Blood',
  PowerTag.Insects: 'Insects',
  PowerTag.Water: 'Water',
};
