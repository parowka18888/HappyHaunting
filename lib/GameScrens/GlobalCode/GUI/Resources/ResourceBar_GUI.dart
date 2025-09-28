import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResourceBar_GUI{
  static getResourceBar(BuildContext context, double width, double height) {
    return Container(
      height: height, width: width, color: Colors.blue,
    );
  }

}