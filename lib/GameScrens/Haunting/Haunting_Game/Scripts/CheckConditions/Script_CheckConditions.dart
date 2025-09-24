class Script_CheckConditions{
  static bool checkIfConditionsAreMet(List<List<int>> conditions, List<int> conditionsMet) {
    for(var conditionList in conditions){
      bool conditionsAreMet = true;
      for(var condition in conditionList){
        if(!conditionsMet.contains(condition)){
          conditionsAreMet = false;
          break;
        }
      }
      if(conditionsAreMet){
        return true;
      }
    }
    return false;
  }

}