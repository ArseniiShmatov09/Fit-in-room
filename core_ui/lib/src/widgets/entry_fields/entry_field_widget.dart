import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core_ui.dart';

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
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppStyles.of(context).detailsTextStyle.copyWith(
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
          borderSide:
              BorderSide(width: 4.0, color: AppColors.of(context).black),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimens.borderRadius20),
          ),
        ),
      ),
      style: AppStyles.of(context).detailsTextStyle.copyWith(
            color: AppColors.of(context).black,
          ),
      keyboardType:
          isDigitsOnlyEntered ? TextInputType.number : TextInputType.text,
      inputFormatters: isDigitsOnlyEntered
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ]
          : <TextInputFormatter>[],
    );
  }
}
