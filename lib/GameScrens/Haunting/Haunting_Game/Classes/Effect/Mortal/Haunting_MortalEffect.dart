import 'package:flame/components.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Effect/Mortal/Mechanics/MortalEffect_Navigator.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Classes/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

import '../../Power/Mechanics/DealingDamage/DealingDamage.dart';

class Haunting_MortalEffect extends Component with HasGameReference<Haunting_Game>{

  Haunting_MortalEffect({required this.power, required this.mortal});

  Haunting_Mortal mortal;
  Haunting_Power power;

  double timeLeft = 0;
  double timer = 1;

  @override
  Future<void> onLoad() async {
    timeLeft = power.powerTime;
    return super.onLoad();
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);
    //DO ACTIONS EVERY 1 SECOND
    //DECREASE TIMER SO IT CAN CALCULATE WHEN TO EXECUTE CODE
    timer -= dt;
    //IF IT IS TIME TO EXECUTE
    if(timer <= 0){
      //RELOAD TIMER
      timer = 1;

      //EXECUTE EFFECT
      MortalEffect_Navigator.navigateMortalEffect(this);

      //DECREASE EFFECT TIME
      timeLeft -= 1;
      print("Time left: $timeLeft");
      //IT EFFECT IS NO LONGER AVAILABLE< REMOVE IT
      if(timeLeft <= 0){
        timeLeft = 0;
        mortal.effects.remove(this);
        removeFromParent();
      }
    }
  }




}