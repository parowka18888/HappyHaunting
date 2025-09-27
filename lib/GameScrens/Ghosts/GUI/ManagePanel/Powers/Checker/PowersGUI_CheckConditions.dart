class PowersGUI_CheckConditions{
  static checkIfPowerTimeIsAvailable(double powerTime) {
    if(powerTime > 0) return true;
    return false;
  }

  static checkIfPowerChanceIsAvailable(double powerChances) {
    if(powerChances < 100) return true;
    return false;
  }

}