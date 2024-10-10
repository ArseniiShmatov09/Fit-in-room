import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'test_history_text_info_widget.dart';

class ItemInfoWidget extends StatelessWidget {
  const ItemInfoWidget({
    Key? key,
    required this.roomId,
    required this.itemWidth,
    required this.itemLength,
    required this.itemHigh,
    required this.isTestPassed,
  }) : super(key: key);

  final int roomId;
  final int itemWidth;
  final int itemLength;
  final int itemHigh;
  final bool isTestPassed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.boxDecoration.copyWith(
        color: AppColors.of(context).lightGray,
      ),
      height: 200,
      width: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TestHistoryInfoTextWidget(
            text: 'Room $roomId',
            style: AppStyles.mainHeaderTextStyle.copyWith(
              color: AppColors.of(context).black,
            ),
          ),
          TestHistoryInfoTextWidget(
            text: 'Item $itemWidth ⨯ $itemLength ⨯ $itemHigh',
            style: AppStyles.detailsTextStyle.copyWith(
              color: AppColors.of(context).black,
            ),
          ),
          Text(
            isTestPassed ? 'PASSED' : 'NOT PASSED',
            style: AppStyles.headerTextStyle.copyWith(
              color: isTestPassed
              ? AppColors.of(context).green
              : AppColors.of(context).red,
            ),
          ),
        ],
      ),
    );
  }
}
