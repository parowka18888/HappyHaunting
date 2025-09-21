import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../../../ViewModels/Haunting/HauntingGame_ViewModel.dart';

class GhostData_GUI_BackgroundLayer{
  static getGhostData_Images(BuildContext context, double height, double width) {
    double rightPadding_GhostImage = width * 0.07;
    return Container(
      height: height, width: width, color: Colors.amber,
      child: Stack(alignment: Alignment(0, 0),
        children: [
          getBackground(),
          Positioned(
              top: 0,
              right: rightPadding_GhostImage,
              child: getGhostImage(context, height)
          ),

        ],
      ),
    );
  }

  static getBackground() {
    return Image.asset('assets/images/UI/GhostBackground/GhostBackground_Neutral.png', fit: BoxFit.fitHeight,);
    // return Image.asset('assets/images/UI/GhostBackground/GhostBackground_${viewModel.chosenGhost!.color}.png', fit: BoxFit.fitHeight,);
  }

  static getGhostImage(BuildContext context, double height) {
    double ghostHeight = height * 0.8;
    HauntingGame_ViewModel viewModel = context.watch<HauntingGame_ViewModel>();
    return Container(
        height: ghostHeight,
        child: Column(
          children: [
            Expanded(
                child: Image.asset(
                  'assets/images/Ghosts/${viewModel.chosenGhost!.image}.png',
                  // height: ghostHeight,
                  fit: BoxFit.fitHeight,
                )
            ),
          ],
        )
    );
    // return Container(
    //   height: height, color: Colors.amber,
    //     child: Expanded(child: Image.asset('assets/images/Ghosts/ClothesEater.png')),
    // );
  }

}