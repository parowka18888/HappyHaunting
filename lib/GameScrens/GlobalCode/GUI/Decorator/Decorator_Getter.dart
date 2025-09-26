import 'package:happyhaunting/Data/Database/Enums/UI/Frame/FrameDecorator.dart';

class Decorator_Getter{
  static String getDecoratorImageByType(FrameDecorator type) {
    switch(type){
      case FrameDecorator.right:
        return 'assets/images/UI/Decorator/FrameDecorator_Right.png';
      case FrameDecorator.left:
        return 'assets/images/UI/Decorator/FrameDecorator_Left.png';
      case FrameDecorator.upsideDownRight:
        return 'assets/images/UI/Decorator/FrameDecorator_Right_UpsideDown.png';
      case FrameDecorator.upsideDownLeft:
        return 'assets/images/UI/Decorator/FrameDecorator_Left_UpsideDown.png';
    }
  }

}