// GENERATED CODE - DO NOT MODIFY BY HAND

part of '08_Player.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerAdapter extends TypeAdapter<Player> {
  @override
  final int typeId = 8;

  @override
  Player read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Player()
      ..owningGold = fields[0] as int
      ..owningEssence_Fear = fields[1] as int
      ..owningEssence_Madness = fields[2] as int
      ..owningEssence_Faith = fields[3] as int
      ..owningEssence_Soul = fields[4] as int
      ..owningEssence_Emotions = fields[5] as int
      ..owningEssence_Impurity = fields[6] as int;
  }

  @override
  void write(BinaryWriter writer, Player obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.owningGold)
      ..writeByte(1)
      ..write(obj.owningEssence_Fear)
      ..writeByte(2)
      ..write(obj.owningEssence_Madness)
      ..writeByte(3)
      ..write(obj.owningEssence_Faith)
      ..writeByte(4)
      ..write(obj.owningEssence_Soul)
      ..writeByte(5)
      ..write(obj.owningEssence_Emotions)
      ..writeByte(6)
      ..write(obj.owningEssence_Impurity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player()
  ..owningGold = (json['owningGold'] as num).toInt()
  ..owningEssence_Fear = (json['owningEssence_Fear'] as num).toInt()
  ..owningEssence_Madness = (json['owningEssence_Madness'] as num).toInt()
  ..owningEssence_Faith = (json['owningEssence_Faith'] as num).toInt()
  ..owningEssence_Soul = (json['owningEssence_Soul'] as num).toInt()
  ..owningEssence_Emotions = (json['owningEssence_Emotions'] as num).toInt()
  ..owningEssence_Impurity = (json['owningEssence_Impurity'] as num).toInt();

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'owningGold': instance.owningGold,
      'owningEssence_Fear': instance.owningEssence_Fear,
      'owningEssence_Madness': instance.owningEssence_Madness,
      'owningEssence_Faith': instance.owningEssence_Faith,
      'owningEssence_Soul': instance.owningEssence_Soul,
      'owningEssence_Emotions': instance.owningEssence_Emotions,
      'owningEssence_Impurity': instance.owningEssence_Impurity,
    };
