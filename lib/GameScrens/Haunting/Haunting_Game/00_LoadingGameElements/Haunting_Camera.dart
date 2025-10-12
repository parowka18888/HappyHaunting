import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:happyhaunting/GameScrens/Haunting/Haunting_Game/Haunting_Game.dart';

class Haunting_Camera{

  static double cameraWidth_Modifier = 0.8;
  static double cameraHeight_Modifier = 0.815;

  static void loadCamera(Haunting_Game game, World world) {
    Future.delayed(const Duration(seconds: 1), (){
      CameraComponent cam = CameraComponent.withFixedResolution(
        world: world,
        width: game.width,
        // width: game.width * cameraWidth_Modifier,
        // height: game.height * cameraHeight_Modifier,
        height: game.height,
      );
      cam.viewfinder.anchor = Anchor.topLeft;
      game.camera = cam;
      game.add(cam);

    });
  }

  static void updateCameraByFloor(Haunting_Game game, int chosenFloor) {
    if(chosenFloor == 0){
      game.camera.viewfinder.position = Vector2(0, 0);
    } else if (chosenFloor > 0){
      game.camera.viewfinder.position = Vector2(0, game.height * chosenFloor);
    } else {
      game.camera.viewfinder.position = Vector2(game.width, game.height * chosenFloor.abs());
    }

  }
  
}