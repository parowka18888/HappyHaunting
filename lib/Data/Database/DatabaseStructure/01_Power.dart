import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/PowerScript/PowerScript.dart';
import 'package:happyhaunting/Data/Database/Enums/Haunting/Scripts/PowerScript/PowerType.dart';
import 'package:happyhaunting/Data/Database/Enums/Tags/Power/05_PowerTag.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part '01_Power.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Power extends HiveObject {

  @HiveField(0)  final String id;
  @HiveField(1)  final String name;
  @HiveField(2)  final String description;

  @HiveField(3)  final double stat_Fear;
  @HiveField(4)  final double stat_Health;
  @HiveField(5)  final double stat_Madness;
  @HiveField(6)  final double stat_Faith;
  @HiveField(15)  final double stat_Impurity;
  @HiveField(16)  final double stat_Emotions;

  @HiveField(7)  final double cost;
  @HiveField(8)  final double cooldown;

  @HiveField(9)  final String icon;

  @HiveField(10)  final PowerType powerType;
  @HiveField(14)  final PowerScript? effectScript;
  @HiveField(11)  final double powerChances;

  @HiveField(12)  final double powerTime;

  @HiveField(13)  List<PowerTag> powerTags;




  Power({
  required this.id,
  required this.name,
  required this.description,
  required this.stat_Fear,
  required this.stat_Health,
  required this.stat_Madness,
  required this.stat_Faith,
  required this.cost,
  required this.cooldown,
  required this.icon,
  required this.powerType,
  required this.powerChances,
  required this.powerTime,
  required this.powerTags,
  required this.stat_Emotions,
  required this.stat_Impurity,
    this.effectScript
  });

  factory Power.fromJson(Map<String, dynamic> json) => _$PowerFromJson(json);
  Map<String, dynamic> toJson() => _$PowerToJson(this);
}

//Adapters were generated with build_runner command:
//flutter packages pub run build_runner build