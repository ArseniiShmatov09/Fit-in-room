import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ItemInfoWidget extends StatelessWidget {
  const ItemInfoWidget({
    Key? key,
    required this.roomId,
    required this.itemWidth,
    required this.itemLength,
    required this.itemHigh,
  }): super(key:key);

  final int roomId;
  final int itemWidth;
  final int itemLength;
  final int itemHigh;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.grayBoxDecoration.copyWith(
          color: AppColors.of(context).lightGray,
      ),
      height: 150,
      width: 170,
      child: Column(
        children: <Widget>[
          Text(
            'Room $roomId',
            style: AppStyles.blackHeaderTextStyle.copyWith(
                color: AppColors.of(context).black,
            ),
          ),
          Text(
            'Item $itemWidth ⨯ $itemLength ⨯ $itemHigh',
            style: AppStyles.blackDetailsTextStyle.copyWith(
              color: AppColors.of(context).black,
            ),
          ),
          Text(
            'PASSED',
            style: AppStyles.blackDetailsTextStyle.copyWith(
              color: AppColors.of(context).black,
            ),
          ),
        ],
      ),
    );
  }
}
