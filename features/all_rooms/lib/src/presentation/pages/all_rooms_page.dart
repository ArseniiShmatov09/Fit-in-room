import 'package:add_room/add_room.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:room_detail/room_detail.gm.dart';

import '../bloc/all_rooms_bloc.dart';

@RoutePage()
class AllRoomsPage extends StatefulWidget {
  const AllRoomsPage({Key? key}) : super(key: key);

  @override
  State<AllRoomsPage> createState() => _AllRoomsPageState();
}

class _AllRoomsPageState extends State<AllRoomsPage> {

  @override
  void initState() {
    super.initState();
    context.read<AllRoomsBloc>().add(const LoadAllRoomsEvent());

  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllRoomsBloc, AllRoomsState>(
      builder: (BuildContext context, AllRoomsState state) {
        if (state is AllRoomsLoadingState) {
          return const CircularProgressIndicator();
        }
        if (state is AllRoomsLoadedState) {
          return Padding(
            padding: const EdgeInsets.all(AppDimens.padding16),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: AppStyles.grayBoxDecoration.copyWith(
                          color: AppColors.of(context).lightGray,
                        ),
                        child: ListView.builder(
                          itemExtent: 120,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                AutoRouter.of(context).push(
                                  RoomDetailsRoute(roomId: index,),
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: AppDimens.padding30,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Room $index',
                                        style: AppStyles.blackSubtitleTextStyle.copyWith(
                                          color: AppColors.of(context).black,
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
                const SizedBox(height: AppDimens.sizedBoxHeight15,),
                ElevatedButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const AddRoomRoute());
                  },
                  style: AppStyles.blackButtonStyle.copyWith(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      AppColors.of(context).black,
                    ),
                  ),
                  child: Text(
                    'Add new room',
                    style: AppStyles.whiteButtonTextStyle.copyWith(
                      color: AppColors.of(context).white,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
