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
      powersIDs: (fields[3] as List).cast<String>(),
      icon: fields[4] as String,
      auras: (fields[5] as List).cast<Aura>(),
      aurasIDs: (fields[6] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Ghost obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.powers)
      ..writeByte(3)
      ..write(obj.powersIDs)
      ..writeByte(4)
      ..write(obj.icon)
      ..writeByte(5)
      ..write(obj.auras)
      ..writeByte(6)
      ..write(obj.aurasIDs);
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
      powers: (json['powers'] as List<dynamic>)
          .map((e) => Power.fromJson(e as Map<String, dynamic>))
          .toList(),
      powersIDs:
          (json['powersIDs'] as List<dynamic>).map((e) => e as String).toList(),
      icon: json['icon'] as String,
      auras: (json['auras'] as List<dynamic>)
          .map((e) => Aura.fromJson(e as Map<String, dynamic>))
          .toList(),
      aurasIDs:
          (json['aurasIDs'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GhostToJson(Ghost instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'powers': instance.powers,
      'powersIDs': instance.powersIDs,
      'icon': instance.icon,
      'auras': instance.auras,
      'aurasIDs': instance.aurasIDs,
    };
