import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import '../bloc/room_detail_bloc.dart';
import '../widgets/room_parameters_widget.dart';
import '../widgets/test_room_widget.dart';

@RoutePage()
class RoomDetailsPage extends StatelessWidget {
  final int roomId;

  const RoomDetailsPage({
    Key? key,
    @PathParam('id') required this.roomId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: '');
    return BlocProvider<RoomDetailBloc>(
      create: (_) => RoomDetailBloc(
        getRoomUseCase: GetIt.I<GetRoomUseCase>(),
        roomId: roomId,
      ),
      child: BlocBuilder<RoomDetailBloc, RoomDetailState>(
        builder: (BuildContext context, RoomDetailState state) {
          if (state.status == RoomDetailStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == RoomDetailStatus.loaded) {
            final RoomModel room = state.room ?? RoomModel.empty();
            return Scaffold(
              appBar: AppBar(
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
                    onPressed: () {},
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
                      controller: controller,
                      isDigitsOnlyEntered: true,
                    ),
                    const SizedBox(
                      height: AppDimens.sizedBoxHeight10,
                    ),
                    EntryFieldWidget(
                      labelText: 'Enter length',
                      controller: controller,
                      isDigitsOnlyEntered: true,
                    ),
                    const SizedBox(
                      height: AppDimens.sizedBoxHeight10,
                    ),
                    EntryFieldWidget(
                      labelText: 'Enter height',
                      controller: controller,
                      isDigitsOnlyEntered: true,
                    ),
                    const SizedBox(
                      height: AppDimens.sizedBoxHeight20,
                    ),
                    const TestRoomWidget(),
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
