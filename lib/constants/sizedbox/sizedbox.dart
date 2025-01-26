import 'package:flutter/material.dart';

class Sizebox {
  static SizedBox normalwidthbox = const SizedBox(
    width: 10,
  );
  static SizedBox normalheightbox = const SizedBox(
    height: 10,
  );
   static SizedBox largeheightbox = const SizedBox(
    height: 30,
  );
   static SizedBox mediumheightbox = const SizedBox(
    height: 20,
  );
}

Widget sbheight(double height) {
  return SizedBox(
    height: height,
  );
}

Widget sbwidth(double width) {
  return SizedBox(
    width: width,
  );
}
