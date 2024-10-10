import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core_ui.dart';

class EntryFieldWidget extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final bool isDigitsOnlyEntered;

  const EntryFieldWidget({
    super.key,
    required this.labelText,
    required this.initialValue,
    required this.isDigitsOnlyEntered,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: initialValue);

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
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 4.0),
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimens.borderRadius20)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 4.0),
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimens.borderRadius20)),
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
