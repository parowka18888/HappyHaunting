import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyhaunting/Data/Database/DatabaseStructure/00_Ghost.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/CheckConditions/GhostTier_CheckConditions.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/CheckConditions/GhostTier_CheckConditions.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/CheckConditions/GhostTier_CheckConditions.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/CheckConditions/GhostTier_CheckConditions.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/CheckConditions/GhostTier_CheckConditions.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/Getter/GhostTier_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Tier/GhostTier.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Getter/ScaledUI.dart';

import '../../../../GlobalCode/GUI/Buttons/Button_GUI.dart';
import '../../../../GlobalCode/GUI/Tier/Tier_GUI.dart';

class UpgradeTiersPreview_GUI{
  static getTiersPreview(double width, double height, Ghost ghost) {
    double padding = height * 0.1;
    double size = ScaledUI.getScaledHeight(width, height, padding, 5);
    double currentTierSize = size * 1.2;
    size = size * 0.8;
    return Container(
      height: height, width: width, //color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: GhostTier.values
            .map((tier) => Row(
          children: [
            Button_GUI.getTierButton(ghost, ghost.tier == tier ? currentTierSize : size, tier: tier),
            if (tier != GhostTier.values.last)
              Padding(padding: EdgeInsets.only(left: padding)),
          ],
        ))
            .toList(),
      ),
    );
  }

}