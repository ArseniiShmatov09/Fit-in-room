import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class RectangleButton extends StatelessWidget {
  const RectangleButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
  });

  final String text;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: AppStyles.buttonStyle.copyWith(
        backgroundColor: MaterialStatePropertyAll<Color>(
          backgroundColor,
        ),
      ),
      child: Text(
        text,
        style: AppStyles.of(context).buttonTextStyle.copyWith(
              color: textColor,
            ),
      ),
    );
  }
}
