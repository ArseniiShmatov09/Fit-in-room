import 'package:add_room/add_room.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:room_detail/room_detail.gm.dart';

class AllRoomsPage extends StatelessWidget {
  const AllRoomsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.padding16),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: AppStyles.grayBoxDecoration.copyWith(
                      color: AppColors.of(context).gray,
                  ),
                  child: ListView.builder(
                    itemExtent: 120,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (){
                          AutoRouter.of(context).push(RoomDetailsRoute(roomId: index));                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: AppDimens.padding30),
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
          const SizedBox(height: 15,),
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
}
