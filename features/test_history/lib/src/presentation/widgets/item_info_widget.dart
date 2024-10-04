import 'package:core_ui/gen/fonts.gen.dart';
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
    return  Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(217, 217, 217, 1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 150,
      width: 170,
      child: Column(
        children: <Widget>[
          Text(
            'Room $roomId',
            style: const TextStyle(
              fontFamily: FontFamily.sofiaSans,
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          Text(
            'Item $itemWidth ⨯ $itemLength ⨯ $itemHigh',
            style: const TextStyle(
              fontFamily: FontFamily.sofiaSans,
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          const Text(
            'PASSED',
            style: TextStyle(
              fontFamily: FontFamily.sofiaSans,
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Color.fromRGBO(0, 255, 42, 1),
            ),
          )
        ],
      ),
    );
  }
}
