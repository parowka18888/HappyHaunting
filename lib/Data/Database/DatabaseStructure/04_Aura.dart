import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part '04_Aura.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class Aura extends HiveObject {

  @HiveField(0)  final String id;
  @HiveField(1)  final String name;
  @HiveField(2)  final String icon;


  Aura({
  required this.id,
  required this.name,
  required this.icon,
  });

  factory Aura.fromJson(Map<String, dynamic> json) => _$AuraFromJson(json);
  Map<String, dynamic> toJson() => _$AuraToJson(this);
}

//Adapters were generated with build_runner command:
//flutter packages pub run build_runner build