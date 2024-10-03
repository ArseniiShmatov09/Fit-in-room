import 'package:auto_route/auto_route.dart';
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
          SizedBox(
            height: 575, //???????
            child: ListView.builder(
              itemExtent: 170,
              itemBuilder: (BuildContext context, int index){
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ItemInfoWidget(index: index * 2),
                        const SizedBox(width: 10,),
                        ItemInfoWidget(index: index * 2 + 1),
                      ],
                    ),
                  ],
                );
              }
            ),
          ),
          const SizedBox(height: 15,),
        ],
      ),
    );
  }
}

