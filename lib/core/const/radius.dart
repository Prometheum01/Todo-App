// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class RadiusConst extends BorderRadius {
  static const double _small = 8;
  static const double _medium = 12;
  static const double _large = 16;
  static const double _xLarge = 24;

  const RadiusConst.horizontalLeftLarge()
      : super.horizontal(left: const Radius.circular(_large));
}
