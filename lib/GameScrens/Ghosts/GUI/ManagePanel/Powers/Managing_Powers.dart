import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../GlobalCode/GUI/DedicatedArea/DedicatedArea_GUI.dart';
import '../../../../GlobalCode/GUI/Divider/Divider_GUI.dart';
import '../../Powers/Description/PowerDescription.dart';
import '../../Powers/List/PowerList.dart';
import '../../../../../ViewModels/Selector/GhostSelector_ViewModel.dart';

class Managing_Powers{
  static getPowersBox(BuildContext context, double width, double height) {

    GhostSelector_ViewModel ghostSelector_ViewModel = context.watch<GhostSelector_ViewModel>();

    //BOXES
    double abilitiesButtonsBoxHeight = height * 0.3;
    double dividerBoxHeight = height * 0.06;
    double dividerBoxWidth = width * 1;
    double abilityDescriptionBoxHeight = height - abilitiesButtonsBoxHeight - dividerBoxHeight;

    //CONTENT
    double abilitiesButtonsHeight = abilitiesButtonsBoxHeight     * 0.95;
    double abilityDescriptionHeight = abilityDescriptionBoxHeight * 0.95;

    return Container(
      width: width, height: height, //color: Colors.pink,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DedicatedArea_GUI.getDedicatedArea(context, width, abilitiesButtonsBoxHeight,
                  () => PowerList.getPowerList(ghostSelector_ViewModel, width, abilitiesButtonsHeight)
          ),
          DedicatedArea_GUI.getDedicatedArea(context, width, dividerBoxHeight,
                  () => Divider_GUI.getDivider(dividerBoxWidth, dividerBoxHeight)
          ),
          DedicatedArea_GUI.getDedicatedArea(context, width, abilityDescriptionBoxHeight,
                  () => PowerDescription.getPowerDescriptionBox(context, width, abilityDescriptionHeight)
          ),
        ],
      ),
    );
  }
}