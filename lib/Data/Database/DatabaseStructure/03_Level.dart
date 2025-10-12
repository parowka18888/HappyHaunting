
import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/LevelScript/LevelScript.dart';
import 'package:happyhaunting/Data/Database/JsonConverter/GhostListConverter.dart';
import 'package:happyhaunting/Data/Database/JsonConverter/MortalListConverter.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '02_Mortal.dart';


part '03_Level.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class Level extends HiveObject {

  @HiveField(0)  final String id;
  @HiveField(1)  final String name;
  @HiveField(2)  final String fileName;
  @HiveField(3) @MortalListConverter()  List<Mortal> mortals;
  @HiveField(4)  final double levelWidth;
  @HiveField(5)  final double levelHeight;
  @HiveField(6) @GhostListConverter()  List<Ghost> trappedGhosts;

  @HiveField(7)  final String startingText;
  @HiveField(8)  final LevelScript script;
  @HiveField(9)  final String icon;
  @HiveField(10)  final String background;

  @HiveField(11)  late int rate;
  @HiveField(12)  late int seconds;

  @HiveField(13)  late bool isUnlocked;
  @HiveField(14)  late bool isBeaten;

  @HiveField(15)  late int tileSize;

  Level({
    required this.id,
    required this.name,
    required this.fileName,
    required this.mortals,
    required this.levelWidth,
    required this.levelHeight,
    required this.trappedGhosts,
    required this.startingText,
    required this.script,
    required this.icon,
    required this.background,
    required this.rate,
    required this.seconds,
    required this.isUnlocked,
    required this.isBeaten,
    required this.tileSize,
  });

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);
  Map<String, dynamic> toJson() => _$LevelToJson(this);
}

//Adapters were generated with build_runner command:
//flutter packages pub run build_runner build
