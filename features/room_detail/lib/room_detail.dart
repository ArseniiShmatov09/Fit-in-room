import 'package:auto_route/annotations.dart';

import 'room_detail.gm.dart';

export 'package:room_detail/room_detail.dart';

export 'src/presentation/bloc/room_detail_bloc/room_detail_bloc.dart';
export 'src/presentation/pages/room_detail_page.dart';

@AutoRouterConfig.module()
class RoomDetailModule extends $RoomDetailModule {}