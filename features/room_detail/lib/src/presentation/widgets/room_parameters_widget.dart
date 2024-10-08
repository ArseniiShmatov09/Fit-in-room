import 'package:core_ui/core_ui.dart';
import 'package:edit_room/edit_room.gm.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class RoomParametersWidget extends StatelessWidget {
  final int roomId;
  final int roomHeight;
  final int roomWidth;
  final int roomLength;

  const RoomParametersWidget({
    super.key,
    required this.roomId,
    required this.roomHeight,
    required this.roomWidth,
    required this.roomLength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding16),
      child: Container(
        decoration: AppStyles.grayBoxDecoration.copyWith(
          color: AppColors.of(context).lightGray,
        ),
        height: 220,
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: AppDimens.padding24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Room parameters',
                    style: AppStyles.blackHeaderTextStyle.copyWith(
                      color: AppColors.of(context).black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      AutoRouter.of(context).push(
                        EditRoomRoute(roomId: roomId),
                      );
                    },
                  ),
                ],
              ),
            ),
            const MainDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppDimens.padding24),
              child: Center(
                child: Text(
                  '$roomHeight ⨯ $roomWidth ⨯ $roomLength',
                  style: AppStyles.blackHeaderTextStyle.copyWith(
                    color: AppColors.of(context).black,
                  ),
                ),
              ),
            ),
            const MainDivider(),
          ],
        ),
      ),
    );
  }
}
