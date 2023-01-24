import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/core/const/image.dart';

class ErrorAnimation extends StatelessWidget {
  const ErrorAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(ImageConst.errorAnimationPath);
  }
}
