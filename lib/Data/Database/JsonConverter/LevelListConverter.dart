import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../DatabaseStructure/03_Level.dart';


class LevelListConverter implements JsonConverter<List<Level>, List<dynamic>> {
  const LevelListConverter();

  @override
  List<Level> fromJson(List<dynamic> json) {
    var box = Hive.box<Level>('levels');
    return json.map((id) => box.get(id as String)!).toList();
  }

  @override
  List<dynamic> toJson(List<Level> levels) {
    return levels.map((level) => level.id).toList();
  }
}
