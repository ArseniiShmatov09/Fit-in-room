import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import '../widgets/item_info_widget.dart';

@RoutePage()
class TestHistoryPage extends StatelessWidget {
  const TestHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.padding16),
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
                        AppDimens.sizedBoxWidth10,
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
          AppDimens.sizedBoxHeight15,
        ],
      ),
    );
  }
}
