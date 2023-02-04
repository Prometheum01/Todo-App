import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/services/provider/theme_provider.dart';

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
            decoration: BoxDecoration(
          color: context.watch<ThemeProvider>().scaffoldBackground,
        )),
        Positioned(
          bottom: -16,
          right: -16,
          child: SvgPicture.asset(
            ImageConst.backgroundPath,
            fit: BoxFit.fill,
            color: context.watch<ThemeProvider>().backgroundImage,
          ),
        ),
        child
      ],
    );
  }
}
