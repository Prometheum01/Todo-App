import 'package:flutter/material.dart';

class PaddingConst extends EdgeInsets {
  static const double _small = 8;
  static const double _medium = 12;
  static const double _large = 16;
  static const double _xLarge = 24;

  //All
  const PaddingConst.smallAll() : super.all(_small);
  const PaddingConst.mediumAll() : super.all(_medium);
  const PaddingConst.largeAll() : super.all(_large);
  const PaddingConst.xLargeAll() : super.all(_xLarge);

  //Symmetric
  const PaddingConst.smallSymmetricVertical()
      : super.symmetric(vertical: _small);
  const PaddingConst.mediumSymmetricVertical()
      : super.symmetric(vertical: _medium);
  const PaddingConst.largeSymmetricVertical()
      : super.symmetric(vertical: _large);

  //Only
  const PaddingConst.smallLeft() : super.only(left: _small);
}