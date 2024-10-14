import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../bloc/add_room_bloc.dart';

@RoutePage()
class AddRoomPage extends StatelessWidget {
  const AddRoomPage({super.key});

  void _onEditButtonPressed(
    String name,
    String widthText,
    String lengthText,
    String heightText,
    BuildContext context,
  ) {
    if (heightText.isEmpty ||
        lengthText.isEmpty ||
        widthText.isEmpty ||
        name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
        ),
      );
      return;
    }

    final int width = int.parse(widthText);
    final int length = int.parse(lengthText);
    final int height = int.parse(heightText);
    //final String uniqueId = (Uuid().v4());

    context.read<AddRoomBloc>().add(
          LoadAddRoomEvent(
            id: 1,
            name: name,
            width: width,
            length: length,
            height: height,
            userId: 1,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController widthController = TextEditingController();
    final TextEditingController lengthController = TextEditingController();
    final TextEditingController heightController = TextEditingController();

    return BlocProvider<AddRoomBloc>(
      create: (_) => AddRoomBloc(
        addRoomUseCase: GetIt.I<AddRoomUseCase>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Add new room',
              style: AppStyles.titleTextStyle.copyWith(
                color: AppColors.of(context).black,
              ),
            ),
          ),
        ),
        body: BlocConsumer<AddRoomBloc, AddRoomState>(
          listener: (BuildContext context, AddRoomState state) {
            if (state.status == AddRoomStatus.added) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Room added successfully!')),
              );
              AutoRouter.of(context).back();
            } else if (state.status == AddRoomStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to add room. Please try again.'),
                ),
              );
            }
          },
          builder: (BuildContext context, AddRoomState state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.padding16),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: AppDimens.sizedBoxHeight100),
                    EntryFieldWidget(
                      labelText: 'Enter room name',
                      controller: nameController,
                      isDigitsOnlyEntered: false,
                    ),
                    const SizedBox(height: AppDimens.sizedBoxHeight10),
                    EntryFieldWidget(
                      labelText: 'Enter width',
                      controller: widthController,
                      isDigitsOnlyEntered: true,
                    ),
                    const SizedBox(height: AppDimens.sizedBoxHeight10),
                    EntryFieldWidget(
                      labelText: 'Enter length',
                      controller: lengthController,
                      isDigitsOnlyEntered: true,
                    ),
                    const SizedBox(height: AppDimens.sizedBoxHeight10),
                    EntryFieldWidget(
                      labelText: 'Enter height',
                      controller: heightController,
                      isDigitsOnlyEntered: true,
                    ),
                    const SizedBox(height: AppDimens.sizedBoxHeight20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.padding16,
                      ),
                      child: ElevatedButton(
                        onPressed: () => _onEditButtonPressed(
                          nameController.text,
                          widthController.text,
                          lengthController.text,
                          heightController.text,
                          context,
                        ),
                        style: AppStyles.roundButtonStyle.copyWith(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                            AppColors.of(context).white,
                          ),
                        ),
                        child: Text(
                          'Add new room',
                          style: AppStyles.subtitleTextStyle.copyWith(
                            color: AppColors.of(context).black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
