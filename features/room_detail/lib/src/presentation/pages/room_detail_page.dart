import 'package:all_rooms/all_rooms.gm.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import '../bloc/room_detail_bloc/room_detail_bloc.dart';
import '../widgets/room_parameters_widget.dart';
import '../widgets/test_room_widget.dart';

@RoutePage()
class RoomDetailsPage extends StatelessWidget {
  final String roomId;

  const RoomDetailsPage({
    Key? key,
    @PathParam('id') required this.roomId,
  }) : super(key: key);

  void _onDeleteButtonPressed(BuildContext parentContext, String roomId) {
    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Deleting room',
            style: AppStyles.subtitleTextStyle.copyWith(
              color: AppColors.of(context).black,
            ),
          ),
          content: Text(
            'Are you sure you want to delete this room?',
            style: AppStyles.detailsTextStyle.copyWith(
              color: AppColors.of(context).black,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Back',
                style: AppStyles.subtitleTextStyle.copyWith(
                  color: AppColors.of(context).black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                parentContext.read<RoomDetailBloc>().add(
                      DeleteRoomDetailEvent(roomId: roomId),
                    );
                AutoRouter.of(context).push(const AllRoomsRoute());
              },
              child: Text(
                'Delete',
                style: AppStyles.subtitleTextStyle.copyWith(
                  color: AppColors.of(context).red,
                ),
              ),
            ),
          ],
          backgroundColor: AppColors.of(context).white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadius20),
          ),
        );
      },
    );
  }

  Future<bool> _onPopInvoked(BuildContext context) async {
    await AutoRouter.of(context).replace(const AllRoomsRoute());
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController itemWidthController =
        TextEditingController(text: '');
    final TextEditingController itemLengthController =
        TextEditingController(text: '');
    final TextEditingController itemHeightController =
        TextEditingController(text: '');

    return BlocProvider<RoomDetailBloc>(
      create: (_) => RoomDetailBloc(
        getRoomUseCase: GetIt.I<GetRoomUseCase>(),
        deleteRoomUseCase: GetIt.I<DeleteRoomUseCase>(),
        roomId: roomId,
      ),
      child: BlocBuilder<RoomDetailBloc, RoomDetailState>(
        builder: (BuildContext context, RoomDetailState state) {
          if (state.status == RoomDetailStatus.loaded) {
            final RoomModel room = state.room ?? RoomModel.empty();
            return PopScope(
              onPopInvoked: (bool a) => _onPopInvoked(context),
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      AutoRouter.of(context).replace(const AllRoomsRoute());
                    },
                  ),
                  title: Center(
                    child: Text(
                      room.name,
                      style: AppStyles.titleTextStyle.copyWith(
                        color: AppColors.of(context).black,
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        size: 45,
                      ),
                      onPressed: () {
                        _onDeleteButtonPressed(context, room.id);
                      },
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: AppDimens.sizedBoxHeight30,
                      ),
                      RoomParametersWidget(
                        roomId: room.id,
                        roomHeight: room.height,
                        roomLength: room.length,
                        roomWidth: room.width,
                      ),
                      const SizedBox(
                        height: AppDimens.sizedBoxHeight20,
                      ),
                      EntryFieldWidget(
                        labelText: 'Enter width',
                        controller: itemWidthController,
                        isDigitsOnlyEntered: true,
                      ),
                      const SizedBox(
                        height: AppDimens.sizedBoxHeight10,
                      ),
                      EntryFieldWidget(
                        labelText: 'Enter length',
                        controller: itemLengthController,
                        isDigitsOnlyEntered: true,
                      ),
                      const SizedBox(
                        height: AppDimens.sizedBoxHeight10,
                      ),
                      EntryFieldWidget(
                        labelText: 'Enter height',
                        controller: itemHeightController,
                        isDigitsOnlyEntered: true,
                      ),
                      const SizedBox(
                        height: AppDimens.sizedBoxHeight20,
                      ),
                      TestRoomWidget(
                        roomName: room.name,
                        roomWidth: room.width,
                        roomLength: room.length,
                        roomHeight: room.height,
                        itemWidthController: itemWidthController,
                        itemLengthController: itemLengthController,
                        itemHeightController: itemHeightController,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
