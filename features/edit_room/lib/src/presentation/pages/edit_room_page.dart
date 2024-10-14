import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/edit_room_bloc.dart';

@RoutePage()
class EditRoomPage extends StatelessWidget {
  final int roomId;

  const EditRoomPage({
    super.key,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditRoomBloc>(
      create: (_) => EditRoomBloc(
        getRoomUseCase: GetIt.I<GetRoomUseCase>(),
        roomId: roomId,
      ),
      child: BlocBuilder<EditRoomBloc, EditRoomState>(
        builder: (BuildContext context, EditRoomState state) {
          if (state.status == EditRoomStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == EditRoomStatus.loaded) {
            final RoomModel room = state.room ?? RoomModel.empty();
            final TextEditingController nameController =
                TextEditingController(text: room.name);
            final TextEditingController widthController = TextEditingController(
              text: room.width.toString(),
            );
            final TextEditingController lengthController =
                TextEditingController(
              text: room.length.toString(),
            );
            final TextEditingController heightController =
                TextEditingController(
              text: room.height.toString(),
            );
            return Scaffold(
              appBar: AppBar(
                title: Center(
                  child: Text(
                    'Edit room ${room.name}',
                    style: AppStyles.titleTextStyle.copyWith(
                      color: AppColors.of(context).black,
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: AppDimens.sizedBoxHeight100,
                    ),
                    EntryFieldWidget(
                      labelText: 'Enter room name',
                      controller: nameController,
                      isDigitsOnlyEntered: false,
                    ),
                    const SizedBox(
                      height: AppDimens.sizedBoxHeight10,
                    ),
                    EntryFieldWidget(
                      labelText: 'Enter width',
                      controller: widthController,
                      isDigitsOnlyEntered: true,
                    ),
                    const SizedBox(
                      height: AppDimens.sizedBoxHeight10,
                    ),
                    EntryFieldWidget(
                      labelText: 'Enter length',
                      controller: lengthController,
                      isDigitsOnlyEntered: true,
                    ),
                    const SizedBox(
                      height: AppDimens.sizedBoxHeight10,
                    ),
                    EntryFieldWidget(
                      labelText: 'Enter height',
                      controller: heightController,
                      isDigitsOnlyEntered: true,
                    ),
                    const SizedBox(
                      height: AppDimens.sizedBoxHeight20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.padding16,
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: AppStyles.roundButtonStyle.copyWith(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                            AppColors.of(context).white,
                          ),
                        ),
                        child: Text(
                          'Edit room',
                          style: AppStyles.titleTextStyle.copyWith(
                            color: AppColors.of(context).black,
                          ),
                        ),
                      ),
                    ),
                  ],
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
