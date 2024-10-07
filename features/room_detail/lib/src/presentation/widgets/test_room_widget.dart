import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TestRoomWidget extends StatelessWidget {
  const TestRoomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_16),
      child: Container(
        decoration: AppStyles.grayBoxDecoration.copyWith(
            color: AppColors.of(context).gray,
        ),
        height: 190,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_30),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: AppStyles.whiteRoundButtonStyle.copyWith(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        AppColors.of(context).white,
                    ),
                  ),
                  child: Text(
                    'Start test',
                    style: AppStyles.blackHeaderTextStyle.copyWith(
                      color: AppColors.of(context).black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Center(
              child: Text(
                'Test results',
                style: AppStyles.blackHeaderTextStyle.copyWith(
                  color: AppColors.of(context).black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

