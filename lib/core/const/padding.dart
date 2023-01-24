import 'package:flutter/material.dart';

class PaddingConst extends EdgeInsets {
  static const double _xSmall = 4;
  static const double _small = 8;
  static const double _medium = 12;
  static const double _large = 16;
  static const double _xLarge = 24;

  //All
  const PaddingConst.xSmallAll() : super.all(_xSmall);
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
  const PaddingConst.xLargeSymmetricVertical()
      : super.symmetric(vertical: _xLarge);

  const PaddingConst.xSmallSymmetricHorizontal()
      : super.symmetric(horizontal: _xSmall);
  const PaddingConst.smallSymmetricHorizontal()
      : super.symmetric(horizontal: _small);
  const PaddingConst.mediumSymmetricHorizontal()
      : super.symmetric(horizontal: _medium);
  const PaddingConst.largeSymmetricHorizontal()
      : super.symmetric(horizontal: _large);
  const PaddingConst.xLargeSymmetricHorizontal()
      : super.symmetric(horizontal: _xLarge);

  //Only
  const PaddingConst.xLargeTop() : super.only(top: _xLarge);
  const PaddingConst.smallLeft() : super.only(left: _small);
  const PaddingConst.smallTopMediumBottom()
      : super.only(top: _small, bottom: _medium);
}
