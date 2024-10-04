import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class EntryFieldWidget extends StatelessWidget {
  const EntryFieldWidget({
    super.key,
    required this.labelText,
  });
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
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
      ),
    );
  }
}
