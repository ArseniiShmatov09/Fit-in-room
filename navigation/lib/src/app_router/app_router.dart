import 'package:auto_route/auto_route.dart';
import 'package:home/home.dart';
import 'package:home/home.gm.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  modules: <Type>[
    HomeModule
  ],
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(page: HomeRoute.page, initial: true, path: '/home'),
  ];
}
