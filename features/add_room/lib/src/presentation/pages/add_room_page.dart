import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/add_room_bloc.dart';

@RoutePage()
class AddRoomPage extends StatelessWidget {
  final UserModel user;

  const AddRoomPage({super.key,
    required this.user,
  });

  void _onAddButtonPressed(
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

    context.read<AddRoomBloc>().add(
          LoadAddRoomEvent(
            id: '1',
            name: name,
            width: width,
            length: length,
            height: height,
            username: user.username,
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
        backgroundColor: AppColors.of(context).white,
        appBar: AppBar(
          backgroundColor: AppColors.of(context).white,
          title: Center(
            child: Text(
              'Add new room',
              style: AppStyles.of(context).titleTextStyle.copyWith(
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
              AutoRouter.of(context).maybePop(
                state.roomModel,
              );
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
                        onPressed: () => _onAddButtonPressed(
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
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppDimens.borderRadius20,
                              ),
                              side: AppStyles.appBorderSide.copyWith(
                                color: AppColors.of(context).black,
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          'Add new room',
                          textAlign: TextAlign.center,
                          style: AppStyles.of(context).subtitleTextStyle.copyWith(
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
