import 'package:happyhaunting/Data/Database/DatabaseStructure/04_Aura.dart';
import 'package:happyhaunting/Data/Database/Enums/Stats/Statistic.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';
import 'package:happyhaunting/Data/Database/JsonConverter/AuraListConverter.dart';
import 'package:happyhaunting/Data/Database/JsonConverter/PowerListConverter.dart';
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

  @HiveField(2) @PowerListConverter()  List<Power> powers;

  @HiveField(3)  final String icon;

  @HiveField(4) @AuraListConverter()  List<Aura> auras;

  @HiveField(5)  final double health;
  @HiveField(6)  final String ghostImage;

  @HiveField(8)  late bool isUnlocked;
  @HiveField(9)  final int headCenterPoint;

  @HiveField(10)  late GhostTier tier;
  @HiveField(11)  final Statistic mainStat;
  @HiveField(12)  final List<Statistic> secondaryStats;

  @HiveField(13)  final String description;
  @HiveField(14)  final String ghostPanel;


  @HiveField(7)  final String recruitText;
  @HiveField(15)  final String reserveText;
  @HiveField(16)  final String helpText;
  @HiveField(17)  final String banishText;
  @HiveField(18)  final String hintText;
  @HiveField(19)  final String freeingText;

  Ghost({
    required this.id,
    required this.name,
    required this.powers,
    required this.icon,
    required this.auras,
    required this.health,
    required this.ghostImage,
    required this.isUnlocked,
    required this.headCenterPoint,
    required this.tier,
    required this.mainStat,
    required this.secondaryStats,
    required this.description,
    required this.ghostPanel,
    required this.banishText,
    required this.freeingText,
    required this.helpText,
    required this.hintText,
    required this.recruitText,
    required this.reserveText,
  });

  factory Ghost.fromJson(Map<String, dynamic> json) => _$GhostFromJson(json);
  Map<String, dynamic> toJson() => _$GhostToJson(this);
}

//Adapters were generated with build_runner command:
//flutter packages pub run build_runner build
