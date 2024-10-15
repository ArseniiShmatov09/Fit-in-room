import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/test_room_bloc/test_room_bloc.dart';

class TestRoomWidget extends StatelessWidget {
  final TextEditingController itemWidthController;
  final TextEditingController itemLengthController;
  final TextEditingController itemHeightController;
  final int roomWidth;
  final int roomLength;
  final int roomHeight;

  const TestRoomWidget({
    super.key,
    required this.itemWidthController,
    required this.itemLengthController,
    required this.itemHeightController,
    required this.roomWidth,
    required this.roomLength,
    required this.roomHeight,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TestRoomBloc>(
      create: (_) => TestRoomBloc(),
      child: BlocBuilder<TestRoomBloc, TestRoomState>(
        builder: (BuildContext context, TestRoomState state) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimens.padding16),
            child: Container(
              decoration: AppStyles.boxDecoration.copyWith(
                color: AppColors.of(context).lightGray,
              ),
              height: 190,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: AppDimens.sizedBoxHeight20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.padding30,
                    ),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          final String itemWidth = itemWidthController.text;
                          final String itemLength = itemLengthController.text;
                          final String itemHeight = itemHeightController.text;

                          context.read<TestRoomBloc>().add(
                                ValidateInputEvent(
                                  itemWidth: itemWidth,
                                  itemLength: itemLength,
                                  itemHeight: itemHeight,
                                  roomWidth: roomWidth,
                                  roomLength: roomLength,
                                  roomHeight: roomHeight,
                                ),
                              );
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
                  const SizedBox(
                    height: AppDimens.sizedBoxHeight30,
                  ),
                  if (state is InputErrorState)
                    Center(
                      child: Text(
                        state.error,
                        textAlign: TextAlign.center,
                        style: AppStyles.detailsTextStyle.copyWith(
                          color: AppColors.of(context).red,
                        ),
                      ),
                    ),
                  if (state is TestInProgressState)
                    Center(
                      child: CircularProgressIndicator(
                        color: AppColors.of(context).black,
                      ),
                    ),
                  if (state is TestResultState)
                    Center(
                      child: Text(
                        state.isPassed ? 'PASSED' : 'NOT PASSED',
                        style: AppStyles.mainHeaderTextStyle.copyWith(
                          color: state.isPassed
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
