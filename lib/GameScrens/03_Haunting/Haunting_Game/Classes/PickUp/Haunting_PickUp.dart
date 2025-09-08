import 'package:flame/components.dart';

import '../../Haunting_Game.dart';
import '../Room/SubClasses/InteractiveObjects/Haunting_InteractiveObject.dart';


class Haunting_PickUp extends SpriteComponent with HasGameReference<Haunting_Game> {

  Haunting_PickUp({
    super.position, super.size
  });

  Haunting_InteractiveObject? interactiveObject;
  bool isObjectChanged = false;

  @override
  Future<void> onLoad() async {
    // debugMode = true;
    sprite = interactiveObject != null ? interactiveObject!.sprite : await game.loadSprite('UI/EmptySlot.png');
    return super.onLoad();
  }

  @override
  Future<void> update(double dt) async {
    if(isObjectChanged){
      if(interactiveObject != null){
        sprite = interactiveObject!.sprite;
      } else {
        sprite = await game.loadSprite('UI/EmptySlot.png');
      }
      isObjectChanged = false;
    }

    super.update(dt);
  }

}