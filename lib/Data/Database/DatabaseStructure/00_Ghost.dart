import 'package:happyhaunting/Data/Database/DatabaseStructure/04_Aura.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Statistic.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '01_Power.dart';

part '00_Ghost.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
@JsonSerializable(explicitToJson: true)
class Ghost extends HiveObject {

  @HiveField(0)  final String id;
  @HiveField(1)  final String name;

  @HiveField(2)  List<Power> powers;
  @HiveField(3)  final List<String> powersIDs;

  @HiveField(4)  final String icon;

  @HiveField(5)  List<Aura> auras;
  @HiveField(6)  final List<String> aurasIDs;

  @HiveField(7)  final double health;
  @HiveField(8)  final String ghostImage;
  @HiveField(9)  final String color;
  @HiveField(10)  final String banishingText;

  @HiveField(11)  final bool isUnlocked;
  @HiveField(12)  final int headCenterPoint;

  @HiveField(13)  late GhostTier tier;
  @HiveField(14)  final Statistic mainStat;

  Ghost({
    required this.id,
    required this.name,
    required this.powers,
    required this.powersIDs,
    required this.icon,
    required this.auras,
    required this.aurasIDs,
    required this.health,
    required this.ghostImage,
    required this.color,
    required this.banishingText,
    required this.isUnlocked,
    required this.headCenterPoint,
    required this.tier,
    required this.mainStat,
  });

  factory Ghost.fromJson(Map<String, dynamic> json) => _$GhostFromJson(json);
  Map<String, dynamic> toJson() => _$GhostToJson(this);
}

//Adapters were generated with build_runner command:
//flutter packages pub run build_runner build
