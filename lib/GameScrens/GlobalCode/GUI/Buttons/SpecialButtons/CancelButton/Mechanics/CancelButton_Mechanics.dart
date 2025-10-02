import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Navigator/AppNavigator.dart';
import 'package:happyhaunting/ViewModels/Selector/Ghost/GhostSelector_ViewModel.dart';
import 'package:happyhaunting/ViewModels/Selector/Level/LevelSelector_ViewModel.dart';
import 'package:provider/provider.dart';

class CancelButton_Mechanics{
  static popScreen(BuildContext context) {
    GhostSelector_ViewModel viewModel = context.read<GhostSelector_ViewModel>();
    LevelSelector_ViewModel levelSelector_ViewModel = context.read<LevelSelector_ViewModel>();
    viewModel.clear();
    levelSelector_ViewModel.clear();
    AppNavigator.popScreen(context);
  }

}