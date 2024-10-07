import 'package:add_room/add_room.dart';
import 'package:add_room/add_room.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:home/home.dart';
import 'package:home/home.gm.dart';
import 'package:room_detail/room_detail.dart';
import 'package:room_detail/room_detail.gm.dart';
import 'package:settings/settings.dart';
import 'package:settings/settings.gm.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  modules: <Type>[
    HomeModule,
    RoomDetailModule,
    SettingsModule,
    AddRoomModule,
  ],
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(page: HomeRoute.page, initial: true, path: '/home'),
    AutoRoute(page: RoomDetailsRoute.page, path: '/room/:id'),
    AutoRoute(page: SettingsRoute.page, path: '/settings'),
    AutoRoute(page: AddRoomRoute.page, path: '/add_room'),

  ];
}
