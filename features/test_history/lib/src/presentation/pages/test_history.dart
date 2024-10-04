import 'package:flutter/material.dart';
import '../widgets/item_info_widget.dart';

class TestHistoryPage extends StatelessWidget {
  const TestHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemExtent: 170,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ItemInfoWidget(
                          roomId: index * 2,
                          itemHigh: 10,
                          itemWidth: 10,
                          itemLength: 10,
                        ),
                        const SizedBox(width: 10,),
                        ItemInfoWidget(
                          roomId: index * 2 + 1,
                          itemHigh: 10,
                          itemWidth: 10,
                          itemLength: 10,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 15,),
        ],
      ),
    );
  }
}
