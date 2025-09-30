// GENERATED CODE - DO NOT MODIFY BY HAND

part of '11_Expansion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpansionAdapter extends TypeAdapter<Expansion> {
  @override
  final int typeId = 11;

  @override
  Expansion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Expansion(
      id: fields[0] as String,
      backgroundImage: fields[1] as String,
      townName: fields[2] as String,
      description: fields[3] as String,
      chapters: (fields[4] as List).cast<Chapter>(),
    );
  }

  @override
  void write(BinaryWriter writer, Expansion obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.backgroundImage)
      ..writeByte(2)
      ..write(obj.townName)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.chapters);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpansionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expansion _$ExpansionFromJson(Map<String, dynamic> json) => Expansion(
      id: json['id'] as String,
      backgroundImage: json['backgroundImage'] as String,
      townName: json['townName'] as String,
      description: json['description'] as String,
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExpansionToJson(Expansion instance) => <String, dynamic>{
      'id': instance.id,
      'backgroundImage': instance.backgroundImage,
      'townName': instance.townName,
      'description': instance.description,
      'chapters': instance.chapters,
    };
