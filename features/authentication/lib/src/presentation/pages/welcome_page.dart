import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../../../authentication.gm.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.asset(
              AppImages.welcomeImage,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimens.padding16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Text(
                      'FIT IN ROOM',
                      style: AppStyles.of(context).mainHeaderTextStyle.copyWith(
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = AppDimens.strokeWidth4
                              ..color = AppColors.of(context).white,
                          ),
                    ),
                    Text(
                      'FIT IN ROOM',
                      style: AppStyles.of(context).mainHeaderTextStyle.copyWith(
                            color: AppColors.of(context).black,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimens.sizedBoxHeight100),
                RectangleButton(
                  text: 'CREATE ACCOUNT',
                  onPressed: () {
                    AutoRouter.of(context).replace(
                      const SignUpRoute(),
                    );
                  },
                  backgroundColor: AppColors.of(context).black,
                  textColor: AppColors.of(context).white,
                ),
                const SizedBox(height: AppDimens.sizedBoxHeight10),
                RectangleButton(
                  text: 'HAVE AN ACCOUNT?',
                  onPressed: () {
                    AutoRouter.of(context).replace(
                      const SignInRoute(),
                    );
                  },
                  backgroundColor: AppColors.of(context).white,
                  textColor: AppColors.of(context).black,
                ),
                const SizedBox(height: AppDimens.sizedBoxHeight100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
