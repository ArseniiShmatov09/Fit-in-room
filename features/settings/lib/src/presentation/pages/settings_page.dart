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
        title: const Center(
          child: Text(
            'Settings',
            style: TextStyle(
              fontFamily: FontFamily.sofiaSans,
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Divider(
              color: Color.fromRGBO(128, 128, 128, 1),
              thickness: 0.5,
              height: 0,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Dark mode',
                  style: TextStyle(
                    fontFamily: FontFamily.sofiaSans,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                Switch(
                  value: false,
                  activeColor: Colors.black,
                  onChanged: null,
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: Color.fromRGBO(128, 128, 128, 1),
              thickness: 0.5,
              height: 0,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Increase font',
                  style: TextStyle(
                    fontFamily: FontFamily.sofiaSans,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                Switch(
                  value: false,
                  activeColor: Colors.black,
                  onChanged: null,
                ),
              ],
            ),
            SizedBox(height: 15),
            Divider(
              color: Color.fromRGBO(128, 128, 128, 1),
              thickness: 0.5,
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
