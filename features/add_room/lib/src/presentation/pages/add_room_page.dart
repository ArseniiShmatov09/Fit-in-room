import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddRoomPage extends StatelessWidget {
  const AddRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add new room',
            style: AppStyles.blackTitleTextStyle.copyWith(
              color: AppColors.of(context).black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100,),
            const EntryFieldWidget(
              labelText: 'Enter room name',
              initialValue: '',
            ),
            const SizedBox(height: 10,),
            const EntryFieldWidget(
              labelText: 'Enter width',
              initialValue: '',
            ),
            const SizedBox(height: 10,),
            const EntryFieldWidget(
              labelText: 'Enter length',
              initialValue: '',
            ),
            const SizedBox(height: 10,),
            const EntryFieldWidget(
              labelText: 'Enter height',
              initialValue: '',
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_16),
              child: ElevatedButton(
                onPressed: () {},
                style: AppStyles.whiteRoundButtonStyle.copyWith(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    AppColors.of(context).white,
                  ),
                ),
                child: Text(
                  'Add new room',
                  style: AppStyles.blackTitleTextStyle.copyWith(
                      color: AppColors.of(context).black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
