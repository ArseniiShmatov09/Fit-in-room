import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddRoomPage extends StatelessWidget {
  const AddRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add new room',
            style: AppStyles.blackTitleTextStyle,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100,),
            const EntryFieldWidget(labelText: 'Enter room name'),
            const SizedBox(height: 10,),
            const EntryFieldWidget(labelText: 'Enter width'),
            const SizedBox(height: 10,),
            const EntryFieldWidget(labelText: 'Enter length'),
            const SizedBox(height: 10,),
            const EntryFieldWidget(labelText: 'Enter height'),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {},
                style: AppStyles.whiteRoundButtonStyle,
                child: Text(
                  'Add new room',
                  style: AppStyles.blackTitleTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
