import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../bloc/test_room_bloc/test_room_bloc.dart';

class TestRoomWidget extends StatelessWidget {
  final TextEditingController itemWidthController;
  final TextEditingController itemLengthController;
  final TextEditingController itemHeightController;
  final int roomWidth;
  final int roomLength;
  final int roomHeight;
  final String roomName;

  const TestRoomWidget({
    super.key,
    required this.itemWidthController,
    required this.itemLengthController,
    required this.itemHeightController,
    required this.roomWidth,
    required this.roomLength,
    required this.roomHeight,
    required this.roomName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TestRoomBloc>(
      create: (_) => TestRoomBloc(
        testRoomFitUseCase: GetIt.I<TestRoomFitUseCase>(),
        addTestHistoryUseCase: GetIt.I<AddTestHistoryUseCase>(),
      ),
      child: BlocBuilder<TestRoomBloc, TestRoomState>(
        builder: (BuildContext context, TestRoomState state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding16),
            child: Container(
              decoration: AppStyles.boxDecoration.copyWith(
                color: AppColors.of(context).lightGray,
              ),
              height: 190,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: AppDimens.sizedBoxHeight20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding30),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          final int itemWidth = int.tryParse(itemWidthController.text) ?? 0;
                          final int itemLength = int.tryParse(itemLengthController.text) ?? 0;
                          final int itemHeight = int.tryParse(itemHeightController.text) ?? 0;
                          final String uniqueId = const Uuid().v4();

                          if (itemWidth <= 0 || itemLength <= 0 || itemHeight <= 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('All dimensions must be greater than zero.'),
                              ),
                            );
                          } else {
                            context.read<TestRoomBloc>().add(
                              RunTestEvent(
                                itemWidth: itemWidth,
                                itemLength: itemLength,
                                itemHeight: itemHeight,
                                roomWidth: roomWidth,
                                roomLength: roomLength,
                                roomHeight: roomHeight,
                                id: uniqueId,
                                roomName: roomName,
                              ),
                            );
                          }
                        },
                        style: AppStyles.roundButtonStyle.copyWith(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                            AppColors.of(context).white,
                          ),
                        ),
                        child: Text(
                          'Start test',
                          style: AppStyles.mainHeaderTextStyle.copyWith(
                            color: AppColors.of(context).black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimens.sizedBoxHeight30),

                  if (state.status == TestRoomStatus.loading)
                    Center(
                      child: CircularProgressIndicator(
                        color: AppColors.of(context).black,
                      ),
                    ),

                  if (state.status == TestRoomStatus.passed || state.status == TestRoomStatus.notPassed)
                    Center(
                      child: Text(
                        state.status == TestRoomStatus.passed ? 'PASSED' : 'NOT PASSED',
                        style: AppStyles.mainHeaderTextStyle.copyWith(
                          color: state.status == TestRoomStatus.passed
                              ? AppColors.of(context).green
                              : AppColors.of(context).red,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
