import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TestRoomWidget extends StatelessWidget {
  const TestRoomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding16),
      child: Container(
        decoration: AppStyles.grayBoxDecoration.copyWith(
          color: AppColors.of(context).lightGray,
        ),
        height: 190,
        child: Column(
          children: <Widget>[
            AppDimens.sizedBoxHeight20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding30),
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
            AppDimens.sizedBoxHeight30,
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
