import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaribu/root_layout/cubit/root_layout_cubit.dart';
import 'package:qaribu/root_layout/view/root_layout.dart';
import 'package:qaribu/sign_in/view/sign_in_page.dart';

class RouteGenerator {
  final RootLayoutCubit rootLayoutCubit = RootLayoutCubit();
  Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/root_layout':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: rootLayoutCubit,
            child: RootLayout(),
          ),
          settings: settings,
        );
      case '/signin':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: rootLayoutCubit,
            child: const SignInPage(),
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: rootLayoutCubit,
            child:  RootLayout(),
          ),
          settings: settings,
        );
    }
  }

 static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) =>  Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
        
      ),
    );
  }
}
