part of 'room_detail_bloc.dart';

enum RoomDetailStatus { loading, loaded, failure }

class RoomDetailState {
  const RoomDetailState({
    this.status = RoomDetailStatus.loading,
    this.room,
  });

  final RoomDetailStatus status;
  final RoomModel? room;

  RoomDetailState copyWith({
    RoomDetailStatus? status,
    RoomModel? room,
  }) {
    return RoomDetailState(
      status: status ?? this.status,
      room: room ?? this.room,
    );
  }

  List<Object?> get props => <Object>[room!, status];
}
