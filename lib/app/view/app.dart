// ignore_for_file: flutter_style_todos, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaribu/l10n/l10n.dart';
import 'package:qaribu/on_boarding/view/onboarding_page.dart';
import 'package:qaribu/root_layout/cubit/root_layout_cubit.dart';
import 'package:qaribu/root_layout/view/root_layout.dart';
import 'package:qaribu/root_layout/view/routes/generated_routes.dart';
import 'package:qaribu/themes/color_schemes.g.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootLayoutCubit(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const OnBoardingPage(), // USE THIS AS INITIAL ROUTE
        // initialRoute: '/',
        onGenerateRoute: RouteGenerator().generateRoute,
      ),
    );
  }
}
// TODO: add splash screen to check authentication and load data to app
// TODO: add authentication
// TODO: add onboarding screen to help user understand how to use app 
// flow is splash screen(check firt time opening and authentication) then onboarding -> authentication -> home
