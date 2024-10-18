import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:edit_room/edit_room.gm.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class RoomParametersWidget extends StatefulWidget {
  final String roomId;
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
  _RoomParametersWidgetState createState() => _RoomParametersWidgetState();
}

class _RoomParametersWidgetState extends State<RoomParametersWidget> {
  RoomModel? updatedRoom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding16),
      child: Container(
        decoration: AppStyles.boxDecoration.copyWith(
          color: AppColors.of(context).lightGray,
        ),
        height: 220,
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: AppDimens.padding24),
              child: Text(
                'Room parameters',
                style: AppStyles.of(context).mainHeaderTextStyle.copyWith(
                  color: AppColors.of(context).black,
                ),
              ),
            ),
            const MainDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: AppDimens.padding24),
                  child: Center(
                    child: Text(
                      '${updatedRoom?.width ?? widget.roomWidth} ⨯ '
                      '${updatedRoom?.length ?? widget.roomLength} ⨯ '
                      '${updatedRoom?.height ?? widget.roomHeight}',
                      style: AppStyles.of(context).mainHeaderTextStyle.copyWith(
                        color: AppColors.of(context).black,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: _onEditButtonPressed,
                ),
              ],
            ),
            const MainDivider(),
          ],
        ),
      ),
    );
  }
  Future<void> _onEditButtonPressed() async {
    {
      final dynamic result =
      await AutoRouter.of(context).push(
        EditRoomRoute(roomId: widget.roomId),
      );
      if (result != null && result is RoomModel) {
        setState(() {
          updatedRoom = result;
        });
      }
    }
  }
}
