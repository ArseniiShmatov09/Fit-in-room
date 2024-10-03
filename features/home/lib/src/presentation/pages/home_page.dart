import 'package:all_rooms/all_rooms.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_history/all_items.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  String appBarTitle = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            appBarTitle,
            style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int value) =>
        {
          setState(() {
            currentPageIndex = value;
          }),
          currentPageIndex == 0
              ? appBarTitle = 'All Rooms'
              : appBarTitle = 'Test History'
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'All rooms',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
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
