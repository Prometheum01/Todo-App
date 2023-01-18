import 'package:flutter/material.dart';
import 'package:todo_app/core/const/color.dart';

class OutlineBorderConst extends OutlineInputBorder {
  OutlineBorderConst.descriptionField()
      : super(
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
          borderSide: BorderSide(
            color: const Color(ColorConst.yankeesBlue).withOpacity(0.2),
          ),
        );
  OutlineBorderConst.descriptionErrorField()
      : super(
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
          borderSide: BorderSide(
            color: const Color(ColorConst.deepPink).withOpacity(0.2),
          ),
        );
}

class UnderlineBorderConst extends UnderlineInputBorder {
  UnderlineBorderConst.greyField()
      : super(
          borderSide: BorderSide(
            color: const Color(ColorConst.palatinateBlue).withOpacity(
              0.12,
            ),
          ),
        );
}
