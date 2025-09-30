import 'package:flutter/cupertino.dart';
import 'package:happyhaunting/GameScrens/InitScreen/InitScreen.dart';

class AppNavigator{
  static void navigateToScreen(BuildContext context, screen) {
    Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child, );
      },
    ),
    );
  }

  static void popScreen(BuildContext context) {
    Navigator.of(context).pop(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {return SizedBox();},
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );


  }

}