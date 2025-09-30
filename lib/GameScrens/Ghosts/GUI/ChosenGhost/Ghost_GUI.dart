import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/ViewModels/Selector/Ghost/GhostSelector_ViewModel.dart';
import 'package:provider/provider.dart';

class Ghost_GUI{
  static getGhostImage(BuildContext context, double height, double width) {
    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();
    Ghost? ghost = ghostSelector_ViewModel.chosenGhost;
    return Container(
      width: width,
      child: Stack(alignment: Alignment(0, 0),
        children: [
          if(ghost != null)
            Transform.translate(
              offset: Offset(0, 0),
              child:Image.asset('assets/images/Ghosts/${ghost.ghostImage}.png', fit: BoxFit.fitWidth),
              ),
            // Image.asset('assets/images/Ghosts/${ghost.ghostImage}.png', fit: BoxFit.fitWidth, off)
        ],
      ),
    );
  }

}