import 'package:happyhaunting/Data/Database/DatabaseStructure/12_Chapter.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../DatabaseStructure/01_Power.dart';
import '../DatabaseStructure/03_Level.dart';
import '../DatabaseStructure/04_Aura.dart';


class AuraListConverter implements JsonConverter<List<Aura>, List<dynamic>> {
  const AuraListConverter();

  @override
  List<Aura> fromJson(List<dynamic> json) {
    var box = Hive.box<Aura>('auras');
    return json.map((id) => box.get(id as String)!).toList();
  }

  @override
  List<dynamic> toJson(List<Aura> auras) {
    return auras.map((aura) => aura.id).toList();
  }
}
