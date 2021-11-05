import 'package:flutter/material.dart';

const borderRadius = Radius.circular(50);

const fontFamilySrc = 'assets/fonts/';

final mainColor = Colors.amber[900];

var selectedItem = 0;

const double menuWidth = 0.75;

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
