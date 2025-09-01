import 'package:flame/components.dart';
import 'package:happyhaunting/Data/Database/Enums/PowerType.dart';
import 'package:happyhaunting/Data/Database/Enums/Tags/Power/05_PowerTag.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Mechanics/PowerMechanics.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Haunting_Game.dart';

class Haunting_Power extends Component with HasGameReference<Haunting_Game> {

  Haunting_Power({
    required this.id, required this.name, required this.description, required this.icon,
    required this.cost, required this.cooldown, required this.powerType,
    required this.stat_Fear, required this.stat_Health, required this.stat_Madness, required this.stat_Faith,
    required this.isActivated, required this.isDeactivatingForbidden, required this.powerTime, required this.powerTags
  });

  String id = "";
  String name = "";
  String description = "";
  double cost = 0;
  double stat_Fear = 0;
  double stat_Health = 0;
  double stat_Madness = 0;
  double stat_Faith = 0;
  String icon = "";
  bool isActivated = false;
  bool isDeactivatingForbidden = false;
  PowerType powerType = PowerType.mortalSingle;
  List<PowerTag> powerTags = [];
  double powerTime = 0;

  //COOLDOWN
  double cooldown = 0; //MAX COOLDOWN
  double currentCooldown = 0;


  @override
  void update(double dt) {
    super.update(dt);
    PowerMechanics.usePower(this, game);
    if (currentCooldown > 0) {
      currentCooldown -= dt;
    }
  }
}