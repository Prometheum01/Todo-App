import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/const/color.dart';
import '../../core/const/image.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Color(ColorConst.background),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -16,
          right: -16,
          child: SvgPicture.asset(
            ImageConst.backgroundPath,
            fit: BoxFit.fill,
          ),
        ),
        child
      ],
    );
  }
}
