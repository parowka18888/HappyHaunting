import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part '08_Player.g.dart';

@HiveType(typeId: 8)
@JsonSerializable()
class Player extends HiveObject {

  @HiveField(0) int owningGold = 0;

  @HiveField(1) int owningEssence_Fear = 0;
  @HiveField(2) int owningEssence_Madness = 0;
  @HiveField(3) int owningEssence_Faith = 0;
  @HiveField(4) int owningEssence_Soul = 0;
  @HiveField(5) int owningEssence_Emotions = 0;
  @HiveField(6) int owningEssence_Impurity = 0;

}

//Adapters were generated with build_runner command:
//flutter packages pub run build_runner build