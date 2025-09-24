class ScaledUI{
  static double getScaledHeight(double width, double height, double padding, int itemCount) {
    double iconSize = height;
    double itemsTotalWidth = iconSize * itemCount + padding * (itemCount - 1);
    if(itemsTotalWidth > width){
      double difference = itemsTotalWidth - width;
      iconSize -= difference / itemCount;
      iconSize = iconSize > 0 ? iconSize : 0;
    }
    return iconSize;
  }

}