import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/Navigator/AppNavigator.dart';
import 'package:happyhaunting/ViewModels/Selector/Ghost/GhostSelector_ViewModel.dart';
import 'package:provider/provider.dart';

class CancelButton_Mechanics{
  static popScreen(BuildContext context) {
    GhostSelector_ViewModel viewModel = context.read<GhostSelector_ViewModel>();
    viewModel.clear();
    AppNavigator.popScreen(context);
  }

}