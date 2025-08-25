import 'package:happyhaunting/Data/Database/Enums/Entry.dart';
import 'package:happyhaunting/GameScrens/00_GlobalCode/Getter/IconGetter.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Haunting_Ghost.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Ghost/Subclasses/Power/Haunting_Power.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/Haunting_Game/Classes/Mortal/Haunting_Mortal.dart';
import 'package:happyhaunting/GameScrens/03_Haunting/ViewModel/HauntingGame_ViewModel.dart';

class Haunting_Entry{
  static List<String> addEntry(HauntingGame_ViewModel viewModel) {
    if(viewModel.entries.length > 20){
      viewModel.removeEntryAt(0);
    }
    return [];
  }

  static void addEntry_DealtDamage_PowerDealtDamage(HauntingGame_ViewModel viewModel, Haunting_Ghost ghost, Haunting_Mortal mortal, Haunting_Power power, List<double> damages) {

    List<String> entry = addEntry(viewModel);

    entry.add("Text/" + "Upiór ");
    entry.add("Name/" + ghost.name);
    entry.add("Icon=" + IconGetter.getGhostIcon(ghost));
    entry.add("Text/" + "używa zdolności ");
    entry.add("Name/" + power.name);
    entry.add("Icon=" + IconGetter.getPowerIcon(power));
    entry.add("Text/" + "zadając obrażenia ");
    entry.add("Name/" + damages[0].toString());
    entry.add("Text/" + ";");
    entry.add("Name/" + damages[1].toString());
    entry.add("Text/" + ";");
    entry.add("Name/" + damages[2].toString());
    entry.add("Text/" + ";");
    entry.add("Name/" + damages[3].toString());
    entry.add("Text/" + ";");
    entry.add("Text/" + "śmiertelnikowi  ");
    entry.add("Name/" + mortal.name);
    entry.add("Icon=" + IconGetter.getMortalIcon(mortal));

    viewModel.addEntry(entry);

  }

  static void addEntry_UsesPower(HauntingGame_ViewModel viewModel, Haunting_Ghost ghost, Haunting_Power power) {
    List<String> entry = addEntry(viewModel);

    entry.add("Text/" + "Upiór ");
    entry.add("Name/" + ghost.name);
    entry.add("Icon=" + IconGetter.getGhostIcon(ghost));
    entry.add("Text/" + "używa zdolności ");
    entry.add("Name/" + power.name);
    entry.add("Icon=" + IconGetter.getPowerIcon(power));

    viewModel.addEntry(entry);

  }

  static void addEntry_GhostUsesPower_Targets(HauntingGame_ViewModel viewModel, Haunting_Ghost ghost, List<Haunting_Mortal> targets, Haunting_Power power) {
    List<String> entry = addEntry(viewModel);

    entry.add("Text/" + "Upiór ");
    entry.add("Name/" + ghost.name);
    entry.add("Icon=" + IconGetter.getGhostIcon(ghost));
    entry.add("Text/" + "używa zdolności ");
    entry.add("Name/" + power.name);
    entry.add("Icon=" + IconGetter.getPowerIcon(power));
    entry.add("Text/" + "na śmiertelników ");

    for(final target in targets){
      entry.add("Name/" + target.name);
      entry.add("Icon=" + IconGetter.getMortalIcon(target));
      if(target.name == targets[targets.length - 1].name){
        entry.add("Text/" + ".");
      } else {
        entry.add("Text/" + ", ");
      }
    }

    viewModel.addEntry(entry);
  }

}