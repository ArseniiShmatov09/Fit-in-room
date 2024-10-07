import 'package:flutter/material.dart';

class MainDivider extends StatelessWidget {
  const MainDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        color: Color.fromRGBO(128, 128, 128, 1),
        thickness: 0.5,
        height: 0,
      ),
    );
  }
}
