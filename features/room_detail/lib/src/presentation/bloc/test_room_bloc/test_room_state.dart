part of 'test_room_bloc.dart';

abstract class TestRoomState {}

class InitialState extends TestRoomState {}

class InputErrorState extends TestRoomState {
  final String error;

  InputErrorState(this.error);
}

class TestInProgressState extends TestRoomState {}

class TestResultState extends TestRoomState {
  final bool isPassed;

  TestResultState({required this.isPassed});
}
