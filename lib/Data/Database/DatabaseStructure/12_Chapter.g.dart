// GENERATED CODE - DO NOT MODIFY BY HAND

part of '12_Chapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterAdapter extends TypeAdapter<Chapter> {
  @override
  final int typeId = 12;

  @override
  Chapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chapter(
      id: fields[0] as String,
      backgroundImage: fields[1] as String,
      name: fields[2] as String,
      description: fields[3] as String,
      levels: (fields[4] as List).cast<Level>(),
      number: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Chapter obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.backgroundImage)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.levels)
      ..writeByte(5)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      id: json['id'] as String,
      backgroundImage: json['backgroundImage'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      levels: const LevelListConverter().fromJson(json['levels'] as List),
      number: (json['number'] as num).toInt(),
    );

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'id': instance.id,
      'backgroundImage': instance.backgroundImage,
      'name': instance.name,
      'description': instance.description,
      'levels': const LevelListConverter().toJson(instance.levels),
      'number': instance.number,
    };
