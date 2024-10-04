import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import '../widgets/entry_field_widget.dart';
import '../widgets/room_parameters_widget.dart';
import '../widgets/test_room_widget.dart';

@RoutePage()
class RoomDetailsPage extends StatelessWidget {
  final int roomId;
  const RoomDetailsPage({
    Key? key,
    @PathParam('id')
    required this.roomId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Room $roomId',
            style: const TextStyle(
              fontFamily: FontFamily.sofiaSans,
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

