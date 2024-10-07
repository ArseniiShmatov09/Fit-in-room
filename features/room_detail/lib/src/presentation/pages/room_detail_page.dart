import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import '../widgets/room_parameters_widget.dart';
import '../widgets/test_room_widget.dart';

@RoutePage()
class RoomDetailsPage extends StatelessWidget {
  final int roomId;

  const RoomDetailsPage({
    Key? key,
    @PathParam('id')
    required this.roomId,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Room $roomId',
            style: AppStyles.blackTitleTextStyle.copyWith(
              color: AppColors.of(context).black
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30,),
            RoomParametersWidget(
              roomId: roomId,
              roomHeight: 1,
              roomLength: 1,
              roomWidth: 1,
            ),
            const SizedBox(height: 20,),
            const EntryFieldWidget(
              labelText: 'Enter width',
              initialValue: '',
            ),
            const SizedBox(height: 10,),
            const EntryFieldWidget(
              labelText: 'Enter length',
              initialValue: '',
            ),
            const SizedBox(height: 10,),
            const EntryFieldWidget(
              labelText: 'Enter height',
              initialValue: '',
            ),
            const SizedBox(height: 20,),
            const TestRoomWidget(),
          ],
        ),
      ),
    );
  }
}

