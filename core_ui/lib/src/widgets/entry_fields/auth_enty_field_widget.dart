import 'package:flutter/material.dart';
import '../../../core_ui.dart';

class AuthEntryFieldWidget extends StatelessWidget {
  final String labelText;
  final String helperText;
  final TextEditingController controller;
  final bool shouldObscure;

  const AuthEntryFieldWidget({
    super.key,
    required this.labelText,
    required this.controller,
    required this.helperText,
    required this.shouldObscure,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      child: TextField(
        controller: controller,
        obscureText: shouldObscure,
        decoration: InputDecoration(
          labelText: labelText,
          helperText: helperText,
          labelStyle: AppStyles.of(context).detailsTextStyle.copyWith(
            color: AppColors.of(context).gray,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          helperStyle: AppStyles.of(context).detailsTextStyle.copyWith(
            color: AppColors.of(context).lightBlack,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: AppColors.of(context).white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.of(context).gray,
            ),
            borderRadius: BorderRadius.zero,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.of(context).gray,
            ),
            borderRadius: BorderRadius.zero,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 12.0,
          ),
        ),
        style: AppStyles.of(context).detailsTextStyle.copyWith(
          color: AppColors.of(context).black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
