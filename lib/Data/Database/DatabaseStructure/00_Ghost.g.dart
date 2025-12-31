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
      isUnlocked: fields[8] as bool,
      headCenterPoint: fields[9] as int,
      tier: fields[10] as GhostTier,
      mainStat: fields[11] as Statistic,
      secondaryStats: (fields[12] as List).cast<Statistic>(),
      description: fields[13] as String,
      ghostPanel: fields[14] as String,
      banishText: fields[17] as String,
      freeingText: fields[19] as String,
      helpText: fields[16] as String,
      hintText: fields[18] as String,
      recruitText: fields[7] as String,
      reserveText: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Ghost obj) {
    writer
      ..writeByte(20)
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
      ..writeByte(8)
      ..write(obj.isUnlocked)
      ..writeByte(9)
      ..write(obj.headCenterPoint)
      ..writeByte(10)
      ..write(obj.tier)
      ..writeByte(11)
      ..write(obj.mainStat)
      ..writeByte(12)
      ..write(obj.secondaryStats)
      ..writeByte(13)
      ..write(obj.description)
      ..writeByte(14)
      ..write(obj.ghostPanel)
      ..writeByte(7)
      ..write(obj.recruitText)
      ..writeByte(15)
      ..write(obj.reserveText)
      ..writeByte(16)
      ..write(obj.helpText)
      ..writeByte(17)
      ..write(obj.banishText)
      ..writeByte(18)
      ..write(obj.hintText)
      ..writeByte(19)
      ..write(obj.freeingText);
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
      isUnlocked: json['isUnlocked'] as bool,
      headCenterPoint: (json['headCenterPoint'] as num).toInt(),
      tier: $enumDecode(_$GhostTierEnumMap, json['tier']),
      mainStat: $enumDecode(_$StatisticEnumMap, json['mainStat']),
      secondaryStats: (json['secondaryStats'] as List<dynamic>)
          .map((e) => $enumDecode(_$StatisticEnumMap, e))
          .toList(),
      description: json['description'] as String,
      ghostPanel: json['ghostPanel'] as String,
      banishText: json['banishText'] as String,
      freeingText: json['freeingText'] as String,
      helpText: json['helpText'] as String,
      hintText: json['hintText'] as String,
      recruitText: json['recruitText'] as String,
      reserveText: json['reserveText'] as String,
    );

Map<String, dynamic> _$GhostToJson(Ghost instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'powers': const PowerListConverter().toJson(instance.powers),
      'icon': instance.icon,
      'auras': const AuraListConverter().toJson(instance.auras),
      'health': instance.health,
      'ghostImage': instance.ghostImage,
      'isUnlocked': instance.isUnlocked,
      'headCenterPoint': instance.headCenterPoint,
      'tier': _$GhostTierEnumMap[instance.tier]!,
      'mainStat': _$StatisticEnumMap[instance.mainStat]!,
      'secondaryStats':
          instance.secondaryStats.map((e) => _$StatisticEnumMap[e]!).toList(),
      'description': instance.description,
      'ghostPanel': instance.ghostPanel,
      'recruitText': instance.recruitText,
      'reserveText': instance.reserveText,
      'helpText': instance.helpText,
      'banishText': instance.banishText,
      'hintText': instance.hintText,
      'freeingText': instance.freeingText,
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
