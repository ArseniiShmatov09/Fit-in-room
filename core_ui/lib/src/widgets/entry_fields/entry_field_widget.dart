import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../gen/fonts.gen.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            fontFamily: FontFamily.sofiaSans,
            color: Colors.black,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 4.0),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 4.0),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
        style: const TextStyle(
          fontFamily: FontFamily.sofiaSans,
          color: Colors.black,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
