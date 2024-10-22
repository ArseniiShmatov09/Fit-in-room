import 'package:authentication/authentication.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:navigation/navigation.dart';

import 'error_handler/provider/app_error_handler_provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();

  _setupDI(Flavor.dev);

  runApp(const App());
}

void _setupDI(Flavor flavor) {
  appLocator.pushNewScope(
    scopeName: unauthScope,
    init: (_) {
      AppDI.initDependencies(appLocator, flavor);
      DataDI.initDependencies(appLocator);
      DomainDI.initDependencies(appLocator);
      NavigationDI.initDependencies(appLocator);
    },
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = appLocator<AppRouter>();
    return BlocProvider<SettingsCubit>(
      create: (BuildContext context) =>
          SettingsCubit(themeRepository: GetIt.I<SettingsRepository>()),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (BuildContext context, SettingsState state) {
          return EasyLocalization(
            path: AppLocalization.langFolderPath,
            supportedLocales: AppLocalization.supportedLocales,
            fallbackLocale: AppLocalization.fallbackLocale,
            child: Builder(
              builder: (BuildContext context) {
                return AppErrorHandlerProvider(
                  child: MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    theme: state.brightness == Brightness.dark
                        ? darkTheme
                        : lightTheme,
                    routerConfig: appRouter.config(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
