class PowerList_Getter{
  static double getScaledIconSize(double height, double width, double iconPadding, {
    int count = 4
  }) {
    double iconSize = height - iconPadding;
    double itemsTotalWidth = iconSize * count + iconPadding * (count - 1);
    if(itemsTotalWidth > width){
      double difference = itemsTotalWidth - width;
      iconSize -= difference / count;
      iconSize = iconSize > 0 ? iconSize : 0;
    }
    return iconSize;
  }

}