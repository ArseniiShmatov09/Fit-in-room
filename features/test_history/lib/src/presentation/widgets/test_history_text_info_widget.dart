import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TestHistoryInfoTextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign align;
  final int maxLines;

  const TestHistoryInfoTextWidget({
    required this.text,
    required this.style,
    this.align = TextAlign.center,
    this.maxLines = 2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding5),
      child: Text(
        text,
        style: style,
        textAlign: align,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
      ),
    );
  }
}