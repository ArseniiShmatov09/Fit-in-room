import 'package:flutter/material.dart';
import '../../../core_ui.dart';
import '../../theme/theme.dart';

class MainDivider extends StatelessWidget {
  const MainDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding20),
      child: Divider(
        color: AppColors.of(context).gray,
        thickness: 0.5,
        height: 0,
      ),
    );
  }
}
