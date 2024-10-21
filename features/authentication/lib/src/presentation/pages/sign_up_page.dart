import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:home/home.gm.dart';
import 'package:navigation/navigation.dart';

import '../../../authentication.gm.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController =
        TextEditingController(text: '');
    final TextEditingController passwordController =
        TextEditingController(text: '');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.of(context).white,
        title: Text(
          'FIT IN ROOM',
          style: AppStyles.of(context).titleTextStyle,
        ),
      ),
      backgroundColor: AppColors.of(context).white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.padding16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: AppDimens.sizedBoxHeight30,
            ),
            Text(
              'Login',
              style: AppStyles.of(context).subtitleTextStyle.copyWith(
                    color: AppColors.of(context).gray,
                  ),
            ),
            const SizedBox(
              height: AppDimens.sizedBoxHeight15,
            ),
            AuthEntryFieldWidget(
              helperText: 'email',
              labelText: 'Enter your email',
              isDigitsOnlyEntered: false,
              controller: emailController,
            ),
            const SizedBox(
              height: AppDimens.sizedBoxHeight15,
            ),
            AuthEntryFieldWidget(
              helperText: 'password',
              labelText: 'Enter your password',
              isDigitsOnlyEntered: false,
              controller: passwordController,
            ),
            const SizedBox(
              height: AppDimens.sizedBoxHeight30,
            ),
            RectangleButton(
              text: 'LOGIN',
              onPressed: () {
                AutoRouter.of(context).replace(
                   const HomeRoute(),
                );
              },
              backgroundColor: AppColors.of(context).black,
              textColor: AppColors.of(context).white,
            ),
            const SizedBox(
              height: AppDimens.sizedBoxHeight15,
            ),
            RectangleButton(
              text: 'NEW IN FIT IN ROOM',
              onPressed: () {
                AutoRouter.of(context).replace(
                  const SignInRoute(),
                );
              },
              backgroundColor: AppColors.of(context).white,
              textColor: AppColors.of(context).black,
            ),
          ],
        ),
      ),
    );
  }
}
