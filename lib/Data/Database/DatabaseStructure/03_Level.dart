
import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/LevelScript/LevelScript.dart';
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
  @HiveField(3)  final List<String> mortalsIDs;
  @HiveField(4)  List<Mortal> mortals;
  @HiveField(5)  final double levelWidth;
  @HiveField(6)  final double levelHeight;
  @HiveField(7)  final List<String> trappedGhostsIDs;
  @HiveField(8)  List<Ghost> trappedGhosts;

  @HiveField(9)  final String startingText;
  @HiveField(10)  final LevelScript script;
  @HiveField(11)  final String icon;

  Level({
    required this.id,
    required this.name,
    required this.fileName,
    required this.mortalsIDs,
    required this.mortals,
    required this.levelWidth,
    required this.levelHeight,
    required this.trappedGhostsIDs,
    required this.trappedGhosts,
    required this.startingText,
    required this.script,
    required this.icon,
  });

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);
  Map<String, dynamic> toJson() => _$LevelToJson(this);
}

//Adapters were generated with build_runner command:
//flutter packages pub run build_runner build
