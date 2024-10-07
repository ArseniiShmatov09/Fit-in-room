import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core_ui.dart';

class EntryFieldWidget extends StatelessWidget {
  final String labelText;
  final String initialValue;

  const EntryFieldWidget({
    super.key,
    required this.labelText,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: initialValue);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_16),
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
            borderRadius: BorderRadius.all(Radius.circular(AppDimens.BORDER_RADIUS_20)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 4.0),
            borderRadius: BorderRadius.all(Radius.circular(AppDimens.BORDER_RADIUS_20)),
          ),
        ),
        style: TextStyle(
          fontFamily: FontFamily.sofiaSans,
          color: AppColors.of(context).black,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
