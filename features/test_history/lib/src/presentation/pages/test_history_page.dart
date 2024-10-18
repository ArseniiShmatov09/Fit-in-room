import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import '../bloc/test_history_bloc.dart';
import '../widgets/item_info_widget.dart';

@RoutePage()
class TestHistoryPage extends StatelessWidget {
  const TestHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TestHistoryBloc>(
      create: (_) => TestHistoryBloc(
        getTestHistoriesUseCase: GetIt.I<GetTestHistoriesUseCase>(),
      ),
      child: BlocBuilder<TestHistoryBloc, TestHistoryState>(
        builder: (BuildContext context, TestHistoryState state) {
          if (state.status == TestHistoryStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == TestHistoryStatus.loaded) {
            final int testHistoriesLength = state.testHistories.length;
            return RefreshIndicator(
              onRefresh: () async {
                context.read<TestHistoryBloc>().add(
                      const LoadTestHistoryEvent(),
                    );
              },
              color: AppColors.of(context).black,
              backgroundColor: AppColors.of(context).lightGray,
              strokeWidth: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.padding16),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemExtent: 220,
                        itemCount: testHistoriesLength.isEven
                            ? testHistoriesLength ~/ 2
                            : testHistoriesLength ~/ 2 + 1,
                        itemBuilder: (BuildContext context, int index) {
                          final TestHistoryModel testHistoryItemLeft =
                              state.testHistories[index * 2];
                          final TestHistoryModel? testHistoryItemRight =
                              (index * 2 + 1 < testHistoriesLength)
                                  ? state.testHistories[index * 2 + 1]
                                  : null;
                          return testHistoriesLength == 0
                              ? Center(
                                  child: Text(
                                    'No available data',
                                    style: AppStyles.of(context).subtitleTextStyle.copyWith(
                                      color: AppColors.of(context).black,
                                    ),
                                  ),
                                )
                              : Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        ItemInfoWidget(
                                          roomName:
                                              testHistoryItemLeft.roomName,
                                          itemHigh:
                                              testHistoryItemLeft.itemHeight,
                                          itemWidth:
                                              testHistoryItemLeft.itemWidth,
                                          itemLength:
                                              testHistoryItemLeft.itemLength,
                                          isTestPassed:
                                              testHistoryItemLeft.isTestPassed,
                                        ),
                                        const SizedBox(
                                          height: AppDimens.sizedBoxWidth10,
                                        ),
                                        if (testHistoryItemRight != null)
                                          ItemInfoWidget(
                                            roomName:
                                                testHistoryItemRight.roomName,
                                            itemHigh:
                                                testHistoryItemRight.itemHeight,
                                            itemWidth:
                                                testHistoryItemRight.itemWidth,
                                            itemLength:
                                                testHistoryItemRight.itemLength,
                                            isTestPassed: testHistoryItemRight
                                                .isTestPassed,
                                          ),
                                      ],
                                    ),
                                  ],
                                );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: AppDimens.sizedBoxHeight15,
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
