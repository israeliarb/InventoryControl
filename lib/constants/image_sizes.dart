import 'package:flutter/cupertino.dart';

class ImageSizes {
  static double xsm(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.05;
  }

  static double sm(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.1;
  }

  static double md(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.15;
  }

  static double g(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.2;
  }

  static double gg(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.25;
  }

  static double xl(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.3;
  }

  static double xxl(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.35;
  }

  static double percentage (BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }
}
