import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void _onThemeChanged(BuildContext context, bool isDarkModeEnabled) {
    context.read<ThemeCubit>().setThemeBrightness(
          isDarkModeEnabled ? Brightness.dark : Brightness.light,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.of(context).white,
      appBar: AppBar(
        backgroundColor: AppColors.of(context).white,
        title: Text(
          'Settings',
          style: AppStyles.titleTextStyle.copyWith(
            color: AppColors.of(context).black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.padding16),
        child: Column(
          children: <Widget>[
            const MainDivider(),
            const SizedBox(
              height: AppDimens.sizedBoxHeight15,
            ),
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (BuildContext context, ThemeState state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Dark mode',
                      style: AppStyles.mainHeaderTextStyle.copyWith(
                        color: AppColors.of(context).black,
                      ),
                    ),
                    Switch(
                      value: state.brightness == Brightness.dark,
                      activeColor: AppColors.of(context).green,
                      inactiveTrackColor: AppColors.of(context).gray,
                      onChanged: (bool isDarkModeEnabled) =>
                          _onThemeChanged(context, isDarkModeEnabled),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: AppDimens.sizedBoxHeight10,
            ),
            const MainDivider(),
            const SizedBox(
              height: AppDimens.sizedBoxHeight15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Increase font',
                  style: AppStyles.mainHeaderTextStyle.copyWith(
                    color: AppColors.of(context).black,
                  ),
                ),
                Switch(
                  value: false,
                  inactiveTrackColor: AppColors.of(context).gray,
                  onChanged: null,
                ),
              ],
            ),
            const SizedBox(
              height: AppDimens.sizedBoxHeight15,
            ),
            const MainDivider(),
          ],
        ),
      ),
    );
  }
}
