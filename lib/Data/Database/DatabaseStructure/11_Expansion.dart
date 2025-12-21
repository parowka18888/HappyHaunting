import 'package:happyhaunting/Data/Database/DatabaseStructure/04_Aura.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/12_Chapter.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Statistic.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';
import 'package:happyhaunting/Data/Database/JsonConverter/ChapterListConverter.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../JsonConverter/LevelListConverter.dart';
import '03_Level.dart';

part '11_Expansion.g.dart';

@HiveType(typeId: 11)
@JsonSerializable()
@JsonSerializable(explicitToJson: true)
class Expansion extends HiveObject {

  @HiveField(0)  final String id;
  @HiveField(1)  late String backgroundImage;

  @HiveField(2)  late String townName;
  @HiveField(3)  late String expansionName;
  @HiveField(4)  late String description;

  @HiveField(5)
  @LevelListConverter()
  late List<Level> levels;

  @HiveField(6)  late bool isUnlocked;

  Expansion({
   required this.id,
   required this.backgroundImage,
   required this.townName,
   required this.description,
   required this.expansionName,
   required this.levels,
   required this.isUnlocked,
  });

  factory Expansion.fromJson(Map<String, dynamic> json) => _$ExpansionFromJson(json);
  Map<String, dynamic> toJson() => _$ExpansionToJson(this);
}

//Adapters were generated with build_runner command:
//flutter packages pub run build_runner build
