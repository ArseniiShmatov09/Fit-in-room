import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TestRoomWidget extends StatelessWidget {
  const TestRoomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: AppStyles.grayBoxDecoration,
        height: 190,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: AppStyles.whiteRoundButtonStyle,
                  child: Text(
                    'Start test',
                    style: AppStyles.blackHeaderTextStyle,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Center(
              child: Text(
                'Test results',
                style: AppStyles.blackHeaderTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

