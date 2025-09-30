// GENERATED CODE - DO NOT MODIFY BY HAND

part of '00_Ghost.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GhostAdapter extends TypeAdapter<Ghost> {
  @override
  final int typeId = 0;

  @override
  Ghost read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ghost(
      id: fields[0] as String,
      name: fields[1] as String,
      powers: (fields[2] as List).cast<Power>(),
      icon: fields[3] as String,
      auras: (fields[4] as List).cast<Aura>(),
      health: fields[5] as double,
      ghostImage: fields[6] as String,
      banishingText: fields[7] as String,
      isUnlocked: fields[8] as bool,
      headCenterPoint: fields[9] as int,
      tier: fields[10] as GhostTier,
      mainStat: fields[11] as Statistic,
    );
  }

  @override
  void write(BinaryWriter writer, Ghost obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.powers)
      ..writeByte(3)
      ..write(obj.icon)
      ..writeByte(4)
      ..write(obj.auras)
      ..writeByte(5)
      ..write(obj.health)
      ..writeByte(6)
      ..write(obj.ghostImage)
      ..writeByte(7)
      ..write(obj.banishingText)
      ..writeByte(8)
      ..write(obj.isUnlocked)
      ..writeByte(9)
      ..write(obj.headCenterPoint)
      ..writeByte(10)
      ..write(obj.tier)
      ..writeByte(11)
      ..write(obj.mainStat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GhostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ghost _$GhostFromJson(Map<String, dynamic> json) => Ghost(
      id: json['id'] as String,
      name: json['name'] as String,
      powers: const PowerListConverter().fromJson(json['powers'] as List),
      icon: json['icon'] as String,
      auras: const AuraListConverter().fromJson(json['auras'] as List),
      health: (json['health'] as num).toDouble(),
      ghostImage: json['ghostImage'] as String,
      banishingText: json['banishingText'] as String,
      isUnlocked: json['isUnlocked'] as bool,
      headCenterPoint: (json['headCenterPoint'] as num).toInt(),
      tier: $enumDecode(_$GhostTierEnumMap, json['tier']),
      mainStat: $enumDecode(_$StatisticEnumMap, json['mainStat']),
    );

Map<String, dynamic> _$GhostToJson(Ghost instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'powers': const PowerListConverter().toJson(instance.powers),
      'icon': instance.icon,
      'auras': const AuraListConverter().toJson(instance.auras),
      'health': instance.health,
      'ghostImage': instance.ghostImage,
      'banishingText': instance.banishingText,
      'isUnlocked': instance.isUnlocked,
      'headCenterPoint': instance.headCenterPoint,
      'tier': _$GhostTierEnumMap[instance.tier]!,
      'mainStat': _$StatisticEnumMap[instance.mainStat]!,
    };

const _$GhostTierEnumMap = {
  GhostTier.tier1: 'tier1',
  GhostTier.tier2: 'tier2',
  GhostTier.tier3: 'tier3',
  GhostTier.tier4: 'tier4',
  GhostTier.tier5: 'tier5',
};

const _$StatisticEnumMap = {
  Statistic.fear: 'fear',
  Statistic.health: 'health',
  Statistic.madness: 'madness',
  Statistic.faith: 'faith',
  Statistic.impurity: 'impurity',
  Statistic.emotions: 'emotions',
};
