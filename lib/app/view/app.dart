// ignore_for_file: flutter_style_todos, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:qaribu/l10n/l10n.dart';
import 'package:qaribu/on_boarding/view/onboarding_page.dart';
import 'package:qaribu/root_layout/cubit/root_layout_cubit.dart';
import 'package:qaribu/root_layout/view/root_layout.dart';
import 'package:qaribu/root_layout/view/routes/generated_routes.dart';
import 'package:qaribu/sign_in/view/sign_in_page.dart';
import 'package:qaribu/themes/color_schemes.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isFirstTime = true;
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    initializeApp(context);
  }

  Future<void> initializeApp(BuildContext? context) async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTimeOpened = prefs.getBool('isFirstTime') ?? true;
    final isUserAuthenticated = prefs.getBool('isAuthenticated') ?? false;

    setState(() {
      isFirstTime = isFirstTimeOpened;
      isAuthenticated = isUserAuthenticated;
    });
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootLayoutCubit(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: determineInitialScreen(), // USE THIS AS INITIAL ROUTE
        // initialRoute: '/',
        onGenerateRoute: RouteGenerator().generateRoute,
      ),
    );
  }

  Widget determineInitialScreen() {
    if (isFirstTime) {
      return const OnBoardingPage();
    } else {
      return isAuthenticated ? RootLayout() : const SignInPage();
    }
  }
}
// TODO: add splash screen to check authentication and load data to app
// TODO: add authentication
// TODO: add onboarding screen to help user understand how to use app 
// flow is splash screen(check first time opening and authentication) then onboarding -> authentication -> home
