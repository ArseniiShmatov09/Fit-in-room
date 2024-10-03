
import 'package:flutter/material.dart';

import '../widgets/entry_field_widget.dart';
import '../widgets/room_parameters_widget.dart';
import '../widgets/test_room_widget.dart';

class RoomDetailsPage extends StatelessWidget {
  const RoomDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Room 1',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete, size: 45,),
            onPressed: () {},
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            RoomParametersWidget(),
            SizedBox(height: 20,),
            EntryFieldWidget(labelText: 'Width'),
            SizedBox(height: 10,),
            EntryFieldWidget(labelText: 'Length'),
            SizedBox(height: 10,),
            EntryFieldWidget(labelText: 'Height'),
            SizedBox(height: 20,),
            TestRoomWidget(),
          ],
        ),
      ),
    );
  }
}

