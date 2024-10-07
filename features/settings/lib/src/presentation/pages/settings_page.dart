import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: AppStyles.blackTitleTextStyle.copyWith(
              color: AppColors.of(context).black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.PADDING_16),
        child: Column(
          children: <Widget>[
            const MainDivider(),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Dark mode',
                  style: AppStyles.blackHeaderTextStyle.copyWith(
                    color: AppColors.of(context).black,
                  ),
                ),
                Switch(
                  value: false,
                  activeColor: AppColors.of(context).black,
                  onChanged: null,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const MainDivider(),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Increase font',
                  style: AppStyles.blackHeaderTextStyle.copyWith(
                    color: AppColors.of(context).black,
                  ),
                ),
                Switch(
                  value: false,
                  activeColor: AppColors.of(context).black,
                  onChanged: null,
                ),
              ],
            ),
            const SizedBox(height: 15),
            const MainDivider(),
          ],
        ),
      ),
    );
  }
}
