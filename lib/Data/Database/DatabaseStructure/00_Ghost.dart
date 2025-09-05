import 'package:happyhaunting/Data/Database/DatabaseStructure/04_Aura.dart';
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
  });

  factory Ghost.fromJson(Map<String, dynamic> json) => _$GhostFromJson(json);
  Map<String, dynamic> toJson() => _$GhostToJson(this);
}

//Adapters were generated with build_runner command:
//flutter packages pub run build_runner build
