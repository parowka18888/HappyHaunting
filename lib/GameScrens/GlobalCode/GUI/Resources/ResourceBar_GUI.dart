import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:happyhaunting/Data/Database/Enums/Resource/Getter/Resource_Getter.dart';
import 'package:happyhaunting/Data/Database/Enums/Resource/Resource.dart';
import 'package:happyhaunting/Data/Database/Enums/UI/Frame/FrameType.dart';
import 'package:happyhaunting/Data/Database/Getters/DatabasePlayer_Getter.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/FramedWindow/FramedWindow_GUI.dart';
import 'package:happyhaunting/GameScrens/GlobalCode/GUI/Text/TextAndFont.dart';

class ResourceBar_GUI{
  static getResourceBar(BuildContext context, double width, double height) {
    //RESOURCE BAR
    double resourceBarHeight = height * 0.07;
    double resourceBarWidth = width * 0.6;

    return Positioned(
        top: 0,
        child: Container(
          height: resourceBarHeight, width: resourceBarWidth, color: Colors.blue,
          child: Stack(
            alignment: Alignment(0, 0),
            children: [
              getResourceList(context, resourceBarWidth, resourceBarHeight)
            ],
          ),
      ));
  }

  static getResourceList(BuildContext context, double width, double height) {
    double itemCount = 7;
    List<Resource> resourceList = Resource.values;

    double itemWidth = width / 7;

    return Container(
      height: height, width: width,// color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: resourceList.map((resource) {
          return FramedWindow_GUI.getFramedWindow(context, itemWidth, height,
            function: () => getSingleResourceBox(resource, height, itemWidth),
            // frameType: FrameType.Gold
          );
          // return getSingleResourceBox(resource, height, itemWidth);
        }).toList(),
      ),
    );
  }

  static Widget getSingleResourceBox(Resource resource, double height, double width) {
    double imageWidth = height;
    double imageHeight = height * 0.75;
    double padding = width * 0.05;
    double valueWidth = width - imageWidth - padding;
    return Container(
      height: height, width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //IMAGE
          Container(
            height: imageHeight, width: imageWidth,
            child: Image.asset('assets/images/UI/Currency/${Resource_Getter.getResourceImage(resource)}.png')
          ),
          Padding(padding: EdgeInsets.only(left: padding)),
          //VALUE
          TextAndFont.getText(valueWidth, height, DatabasePlayer_Getter.getPlayerResourceCountByResource(resource).toString(), alignment: Alignment.centerLeft)
        ],
      ),
    );
  }

}