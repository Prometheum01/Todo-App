import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/const/image.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        ImageConst.backwardIconPath,
      ),
    );
  }
}
