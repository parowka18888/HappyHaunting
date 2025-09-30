import 'package:happyhaunting/Data/Database/DatabaseStructure/12_Chapter.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../DatabaseStructure/03_Level.dart';


class ChapterListConverter implements JsonConverter<List<Chapter>, List<dynamic>> {
  const ChapterListConverter();

  @override
  List<Chapter> fromJson(List<dynamic> json) {
    var box = Hive.box<Chapter>('chapters');
    return json.map((id) => box.get(id as String)!).toList();
  }

  @override
  List<dynamic> toJson(List<Chapter> chapters) {
    return chapters.map((chapter) => chapter.id).toList();
  }
}
