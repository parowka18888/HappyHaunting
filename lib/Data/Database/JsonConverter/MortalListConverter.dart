import 'package:happyhaunting/Data/Database/DatabaseStructure/12_Chapter.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../DatabaseStructure/00_Ghost.dart';
import '../DatabaseStructure/01_Power.dart';
import '../DatabaseStructure/02_Mortal.dart';
import '../DatabaseStructure/03_Level.dart';
import '../DatabaseStructure/04_Aura.dart';


class MortalListConverter implements JsonConverter<List<Mortal>, List<dynamic>> {
  const MortalListConverter();

  @override
  List<Mortal> fromJson(List<dynamic> json) {
    var box = Hive.box<Mortal>('mortals');
    return json.map((id) => box.get(id as String)!).toList();
  }

  @override
  List<dynamic> toJson(List<Mortal> mortals) {
    return mortals.map((mortal) => mortal.id).toList();
  }
}
