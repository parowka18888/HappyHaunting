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

  @HiveField(7)  final double cost;
  @HiveField(8)  final double cooldown;

  @HiveField(9)  final String icon;

  @HiveField(10)  final String powerType;
  @HiveField(11)  final int powerChances;

  @HiveField(12)  final double powerTime;




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
  });

  factory Power.fromJson(Map<String, dynamic> json) => _$PowerFromJson(json);
  Map<String, dynamic> toJson() => _$PowerToJson(this);
}

//Adapters were generated with build_runner command:
//flutter packages pub run build_runner build