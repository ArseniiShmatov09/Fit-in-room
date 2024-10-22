import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/home.gm.dart';
import 'package:navigation/navigation.dart';
import '../../../authentication.gm.dart';
import '../bloc/authentication_bloc.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(text: '');
    final TextEditingController emailController = TextEditingController(text: '');
    final TextEditingController passwordController = TextEditingController(text: '');
    final TextEditingController passwordAgainController = TextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.of(context).white,
        title: Text(
          'FIT IN ROOM',
          style: AppStyles.of(context).titleTextStyle,
        ),
      ),
      backgroundColor: AppColors.of(context).white,
      body: BlocProvider<AuthBloc>(
        create: (BuildContext context) => AuthBloc(
          signUpUseCase: GetIt.I<SignUpUseCase>(),
          signInUseCase: GetIt.I<SignInUseCase>(),
          logoutUseCase: GetIt.I<LogoutUseCase>(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: AppDimens.sizedBoxHeight30),
                Text(
                  'Create account',
                  style: AppStyles.of(context).subtitleTextStyle.copyWith(
                    color: AppColors.of(context).lightBlack,
                  ),
                ),
                const SizedBox(height: AppDimens.sizedBoxHeight15),
                AuthEntryFieldWidget(
                  helperText: 'name',
                  labelText: 'Enter your name',
                  isDigitsOnlyEntered: false,
                  controller: nameController,
                ),
                const SizedBox(height: AppDimens.sizedBoxHeight15),
                AuthEntryFieldWidget(
                  helperText: 'email',
                  labelText: 'Enter your email',
                  isDigitsOnlyEntered: false,
                  controller: emailController,
                ),
                const SizedBox(height: AppDimens.sizedBoxHeight15),
                AuthEntryFieldWidget(
                  helperText: 'password',
                  labelText: 'Enter your password',
                  isDigitsOnlyEntered: false,
                  controller: passwordController,
                ),
                const SizedBox(height: AppDimens.sizedBoxHeight15),
                AuthEntryFieldWidget(
                  helperText: 'password again',
                  labelText: 'Enter the password again',
                  isDigitsOnlyEntered: false,
                  controller: passwordAgainController,
                ),
                const SizedBox(height: AppDimens.sizedBoxHeight15),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (BuildContext context, AuthState state) {
                    if (state.status == AuthStatus.success) {
                      AutoRouter.of(context).replace(const HomeRoute());
                    } else if (state.status == AuthStatus.failure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error ?? 'Registration failed')),
                      );
                    }
                  },
                  builder: (BuildContext context, AuthState state) {
                    if (state.status == AuthStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return RectangleButton(
                      text: 'CREATE ACCOUNT',
                      onPressed: () {
                        if (passwordController.text != passwordAgainController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Passwords do not match')),
                          );
                          return;
                        }

                        final UserModel user = UserModel(
                          username: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        context.read<AuthBloc>().add(SignUpRequestedEvent(user));
                      },
                      backgroundColor: AppColors.of(context).black,
                      textColor: AppColors.of(context).white,
                    );
                  },
                ),
                const SizedBox(height: AppDimens.sizedBoxHeight15),
                RectangleButton(
                  text: 'HAVE AN ACCOUNT?',
                  onPressed: () {
                    AutoRouter.of(context).replace(const SignInRoute());
                  },
                  backgroundColor: AppColors.of(context).white,
                  textColor: AppColors.of(context).black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
