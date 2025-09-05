import 'package:happyhaunting/Data/Database/Enums/Tags/Mortal/06_MortalTag.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';


part '02_Mortal.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Mortal extends HiveObject {

  @HiveField(0)  final String id;
  @HiveField(1)  final String name;
  @HiveField(2)  final double stat_Fear;
  @HiveField(3)  final double stat_Health;
  @HiveField(4)  final double stat_Madness;
  @HiveField(5)  final double stat_Faith;
  @HiveField(6)  final double stat_Multiplier_Fear;
  @HiveField(7)  final double stat_Multiplier_Health;
  @HiveField(8)  final double stat_Multiplier_Madness;
  @HiveField(9)  final double stat_Multiplier_Faith;
  @HiveField(10) final String? type;
  @HiveField(11) final String icon;

  @HiveField(12)  final List<String> mortalTagsIDs;
  @HiveField(13)  List<MortalTag> mortalTags;

  @HiveField(14)  final double exorcismStrength;

  Mortal({
    required this.id,
    required this.name,
    required this.stat_Fear,
    required this.stat_Health,
    required this.stat_Madness,
    required this.stat_Faith,
    required this.stat_Multiplier_Fear,
    required this.stat_Multiplier_Health,
    required this.stat_Multiplier_Madness,
    required this.stat_Multiplier_Faith,
    required this.type,
    required this.icon,
    required this.mortalTagsIDs,
    required this.mortalTags,
    required this.exorcismStrength,
  });

  factory Mortal.fromJson(Map<String, dynamic> json) => _$MortalFromJson(json);
  Map<String, dynamic> toJson() => _$MortalToJson(this);
}

//Adapters were generated with build_runner command:
//flutter packages pub run build_runner build
