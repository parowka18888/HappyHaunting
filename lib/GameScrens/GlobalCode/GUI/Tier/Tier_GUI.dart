class Tier_GUI{
  static String getTierImage(int level) {
    switch(level){
      case 1: { return 'Tier1'; }
      case 2: { return 'Tier2'; }
      case 3: { return 'Tier3'; }
      case 4: { return 'Tier4'; }
      case 5: { return 'Tier5'; }
      default: {return 'Tier1';}
    }
  }

}