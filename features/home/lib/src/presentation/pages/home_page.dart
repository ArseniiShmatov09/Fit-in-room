import 'package:all_rooms/all_rooms.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:settings/settings.gm.dart';
import 'package:test_history/test_history.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  String appBarTitle = 'All Rooms';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            appBarTitle,
            style: AppStyles.blackTitleTextStyle.copyWith(
                color: AppColors.of(context).black
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
        onDestinationSelected: (int value) {
          setState(() {
            currentPageIndex = value;
            appBarTitle = value == 0 ? 'All Rooms' : 'Test History';
          });
        },
        selectedIndex: currentPageIndex,
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

      body:<Widget> [
        const AllRoomsPage(),
        const TestHistoryPage(),
      ][currentPageIndex],
    );
  }
}
