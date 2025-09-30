import 'package:happyhaunting/Data/Database/DatabaseStructure/12_Chapter.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../DatabaseStructure/00_Ghost.dart';
import '../DatabaseStructure/01_Power.dart';
import '../DatabaseStructure/03_Level.dart';
import '../DatabaseStructure/04_Aura.dart';


class GhostListConverter implements JsonConverter<List<Ghost>, List<dynamic>> {
  const GhostListConverter();

  @override
  List<Ghost> fromJson(List<dynamic> json) {
    var box = Hive.box<Ghost>('ghosts');
    return json.map((id) => box.get(id as String)!).toList();
  }

  @override
  List<dynamic> toJson(List<Ghost> ghosts) {
    return ghosts.map((ghost) => ghost.id).toList();
  }
}
