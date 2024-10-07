import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ItemInfoWidget extends StatelessWidget {
  const ItemInfoWidget({
    Key? key,
    required this.roomId,
    required this.itemWidth,
    required this.itemLength,
    required this.itemHigh
  }): super(key:key);

  final int roomId;
  final int itemWidth;
  final int itemLength;
  final int itemHigh;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.grayBoxDecoration,
      height: 150,
      width: 170,
      child: Column(
        children: <Widget>[
          Text(
            'Room $roomId',
            style: AppStyles.blackHeaderTextStyle,
          ),
          Text(
            'Item $itemWidth ⨯ $itemLength ⨯ $itemHigh',
            style: AppStyles.blackDetailsTextStyle,
          ),
          Text(
            'PASSED',
            style: AppStyles.blackDetailsTextStyle,
          )
        ],
      ),
    );
  }
}
