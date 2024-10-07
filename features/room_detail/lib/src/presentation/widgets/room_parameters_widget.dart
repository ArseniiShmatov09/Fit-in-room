import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class RoomParametersWidget extends StatelessWidget {
  const RoomParametersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: AppStyles.grayBoxDecoration,
        height: 220,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Room parameters',
                    style: AppStyles.blackHeaderTextStyle,
                  ),
                  const Icon(Icons.edit),
                ],
              ),
            ),
            const MainDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Center(
                child: Text(
                  'height*width*length',
                  style: AppStyles.blackHeaderTextStyle,
                ),
              ),
            ),
            const MainDivider(),
          ],
        ),
      ),
    );
  }
}
