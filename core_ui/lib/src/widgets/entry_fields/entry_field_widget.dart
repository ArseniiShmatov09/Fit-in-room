import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core_ui.dart';
import '../../theme/app_colors.dart';

class EntryFieldWidget extends StatelessWidget {
  final String labelText;
  final bool isDigitsOnlyEntered;
  final TextEditingController controller;

  const EntryFieldWidget({
    super.key,
    required this.labelText,
    required this.isDigitsOnlyEntered,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontFamily: FontFamily.sofiaSans,
            color: AppColors.of(context).black,
          ),
          filled: true,
          fillColor: AppColors.of(context).white,
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 4.0, color: AppColors.of(context).black),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppDimens.borderRadius20),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 4.0, color: AppColors.of(context).black),
            borderRadius:
               const BorderRadius.all(Radius.circular(AppDimens.borderRadius20)),
          ),
        ),
        style: TextStyle(
          fontFamily: FontFamily.sofiaSans,
          color: AppColors.of(context).black,
        ),
        keyboardType:
            isDigitsOnlyEntered ? TextInputType.number : TextInputType.text,
        inputFormatters: isDigitsOnlyEntered
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ]
            : <TextInputFormatter>[],
      ),
    );
  }
}
