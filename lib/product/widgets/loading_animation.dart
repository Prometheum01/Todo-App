import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/const/image.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(ImageConst.loadingAnimationPath);
  }
}
