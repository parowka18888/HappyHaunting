import 'package:happyhaunting/Data/Database/DatabaseStructure/12_Chapter.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../DatabaseStructure/01_Power.dart';
import '../DatabaseStructure/03_Level.dart';


class PowerListConverter implements JsonConverter<List<Power>, List<dynamic>> {
  const PowerListConverter();

  @override
  List<Power> fromJson(List<dynamic> json) {
    var box = Hive.box<Power>('powers');
    return json.map((id) => box.get(id as String)!).toList();
  }

  @override
  List<dynamic> toJson(List<Power> powers) {
    return powers.map((power) => power.id).toList();
  }
}
