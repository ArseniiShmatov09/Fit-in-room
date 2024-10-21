import 'package:add_room/add_room.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:room_detail/room_detail.gm.dart';

import '../bloc/all_rooms_bloc.dart';

@RoutePage()
class AllRoomsPage extends StatelessWidget {
  const AllRoomsPage({Key? key}) : super(key: key);

  void _onAddRoomButtonPressed(BuildContext context) {
    AutoRouter.of(context).push(const AddRoomRoute()).then((Object? newRoom) {
      if (newRoom != null) {
        context.read<AllRoomsBloc>().add(const LoadAllRoomsEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AllRoomsBloc>(
      create: (_) => AllRoomsBloc(
        getAllRoomsUseCase: GetIt.I<GetAllRoomsUseCase>(),
      ),
      child: BlocBuilder<AllRoomsBloc, AllRoomsState>(
        builder: (BuildContext context, AllRoomsState state) {
          if (state.status == AllRoomsStatus.loading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.of(context).black,
              ),
            );
          }
          if (state.status == AllRoomsStatus.loaded) {
            return Padding(
              padding: const EdgeInsets.all(AppDimens.padding16),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: state.rooms.isEmpty
                        ? Center(
                            child: Text(
                              'No available data',
                              style: AppStyles.of(context)
                                  .subtitleTextStyle
                                  .copyWith(
                                    color: AppColors.of(context).black,
                                  ),
                            ),
                          )
                        : Stack(
                            children: <Widget>[
                              Container(
                                decoration: AppStyles.boxDecoration.copyWith(
                                  color: AppColors.of(context).lightGray,
                                ),
                                child: ListView.builder(
                                  itemExtent: 120,
                                  itemCount: state.rooms.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final RoomModel room = state.rooms[index];
                                    return InkWell(
                                      onTap: () {
                                        AutoRouter.of(context)
                                            .push(
                                          RoomDetailsRoute(
                                            roomId: room.id,
                                          ),
                                        )
                                            .then((Object? newRoom) {
                                          if (newRoom != null) {
                                            context
                                                .read<AllRoomsBloc>()
                                                .add(const LoadAllRoomsEvent());
                                          }
                                        });
                                        ;
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: AppDimens.padding10,
                                            ),
                                            child: Center(
                                              child: Text(
                                                room.name,
                                                style: AppStyles.of(context)
                                                    .subtitleTextStyle
                                                    .copyWith(
                                                      color:
                                                          AppColors.of(context)
                                                              .black,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          const MainDivider(),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(
                    height: AppDimens.sizedBoxHeight15,
                  ),
                  RectangleButton(
                    text: 'ADD NEW ROOM',
                    onPressed: () => _onAddRoomButtonPressed(context),
                    backgroundColor: AppColors.of(context).black,
                    textColor: AppColors.of(context).white,
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.of(context).black,
            ),
          );
        },
      ),
    );
  }
}
