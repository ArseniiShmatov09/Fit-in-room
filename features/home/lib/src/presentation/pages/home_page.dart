import 'package:all_rooms/all_rooms.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.gm.dart';
import 'package:test_history/test_history.gm.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const <PageRouteInfo>[
        AllRoomsRoute(),
        TestHistoryRoute(),
      ],
      builder: (BuildContext context, Widget child) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                tabsRouter.activeIndex == 0 ? 'All Rooms' : 'Test History',
                style: AppStyles.titleTextStyle.copyWith(
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
            ],
          ),
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: tabsRouter.setActiveIndex,
            selectedIndex: tabsRouter.activeIndex,
            indicatorColor: AppColors.of(context).black,
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'All rooms',
              ),
              NavigationDestination(
                icon: Icon(Icons.history),
                label: 'Test history',
              ),
            ],
          ),
          body: child,
        );
      },
    );
  }
}
