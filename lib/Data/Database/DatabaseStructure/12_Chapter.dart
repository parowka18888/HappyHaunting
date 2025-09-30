import 'package:happyhaunting/Data/Database/DatabaseStructure/03_Level.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/04_Aura.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Statistic.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../JsonConverter/LevelListConverter.dart';

part '12_Chapter.g.dart';

@HiveType(typeId: 12)
@JsonSerializable()
@JsonSerializable(explicitToJson: true)
class Chapter extends HiveObject {

  @HiveField(0)  final String id;
  @HiveField(1)  late String backgroundImage;

  @HiveField(2)  late String name;
  @HiveField(3)  late String description;

  @HiveField(4)
  @LevelListConverter()
  late List<Level> levels;

  @HiveField(5)  late int number;

  Chapter({
    required this.id,
    required this.backgroundImage,
    required this.name,
    required this.description,
    required this.levels,
    required this.number,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}

//Adapters were generated with build_runner command:
//flutter packages pub run build_runner build
