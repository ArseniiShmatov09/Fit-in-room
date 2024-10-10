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
            return Padding(
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
                        return Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                ItemInfoWidget(
                                  roomId: testHistoryItemLeft.roomId,
                                  itemHigh: testHistoryItemLeft.itemHeight,
                                  itemWidth: testHistoryItemLeft.itemWidth,
                                  itemLength: testHistoryItemLeft.itemLength,
                                  isTestPassed:
                                      testHistoryItemLeft.isTestPassed,
                                ),
                                const SizedBox(
                                  height: AppDimens.sizedBoxWidth10,
                                ),
                                if (testHistoryItemRight != null)
                                  ItemInfoWidget(
                                    roomId: testHistoryItemRight.roomId,
                                    itemHigh: testHistoryItemRight.itemHeight,
                                    itemWidth: testHistoryItemRight.itemWidth,
                                    itemLength: testHistoryItemRight.itemLength,
                                    isTestPassed: testHistoryItemRight.isTestPassed,
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
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
