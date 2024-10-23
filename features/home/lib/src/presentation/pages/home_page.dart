import 'package:all_rooms/all_rooms.gm.dart';
import 'package:authentication/authentication.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.gm.dart';
import 'package:test_history/test_history.gm.dart';

import '../bloc/logout_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  final UserModel user;

  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: <PageRouteInfo>[
        AllRoomsRoute(user: user),
        TestHistoryRoute(user: user),
      ],
      builder: (BuildContext context, Widget child) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);
        return BlocProvider<LogoutBloc>(
          create: (BuildContext context) => LogoutBloc(
            logoutUseCase: GetIt.I<LogoutUseCase>(),
          ),
          child: BlocBuilder<LogoutBloc, LogoutState>(
            builder: (BuildContext context, LogoutState state) {
              return Scaffold(
                backgroundColor: AppColors.of(context).white,
                appBar: AppBar(
                  backgroundColor: AppColors.of(context).white,
                  automaticallyImplyLeading: false,
                  title: Center(
                    child: Text(
                      tabsRouter.activeIndex == 0
                          ? 'All Rooms'
                          : 'Test History',
                      style: AppStyles.of(context).titleTextStyle.copyWith(
                            color: AppColors.of(context).black,
                          ),
                    ),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        AutoRouter.of(context).push(const SettingsRoute());
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () {
                        _showLogoutConfirmationDialog(context);
                      },
                    ),
                  ],
                ),
                bottomNavigationBar: NavigationBar(
                  backgroundColor: AppColors.of(context).lightGray,
                  onDestinationSelected: tabsRouter.setActiveIndex,
                  selectedIndex: tabsRouter.activeIndex,
                  indicatorColor: AppColors.of(context).white,
                  destinations: <Widget>[
                    NavigationDestination(
                      icon: Icon(
                        Icons.home,
                        color: AppColors.of(context).black,
                      ),
                      label: 'All rooms',
                    ),
                    NavigationDestination(
                      icon: Icon(
                        Icons.history,
                        color: AppColors.of(context).black,
                      ),
                      label: 'Test history',
                    ),
                  ],
                ),
                body: child,
              );
            },
          ),
        );
      },
    );
  }

  void _showLogoutConfirmationDialog(BuildContext parentContext) {
    showDialog<void>(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Are you sure you want to log out?',
            style: AppStyles.of(context).mainHeaderTextStyle.copyWith(
                  color: AppColors.of(context).black,
                ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: AppStyles.of(context).headerTextStyle.copyWith(
                      color: AppColors.of(context).black,
                    ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Logout',
                style: AppStyles.of(context).headerTextStyle.copyWith(
                      color: AppColors.of(context).red,
                    ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                parentContext.read<LogoutBloc>().add(LogoutRequestedEvent(user));
                AutoRouter.of(context).replace(const WelcomeRoute());
              },
            ),
          ],
        );
      },
    );
  }
}
