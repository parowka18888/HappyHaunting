import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Logo_GUI{
  static getLogo(BuildContext context, double logoHeight, double logoWidth) {
    return IgnorePointer(
      ignoring: true,
      child: Container(
        height: logoHeight, width: logoWidth,
        child: Image.asset('assets/images/UI/Logo/HappyHaunting_Logo.png', fit: BoxFit.fitWidth),
      ),
    );
  }

}