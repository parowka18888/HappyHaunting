import 'package:happyhaunting/Data/Database/Enums/PowerType.dart';

class EnumGetter {
  static PowerType getPowerTypeByString(String powerType) {
    return PowerType.values.firstWhere((e) => e.name == powerType);
  }

}