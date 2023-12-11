import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaribu/culture_page/culture.dart';
import 'package:qaribu/expectation/expectation.dart';
import 'package:qaribu/home/home.dart';
import 'package:qaribu/learning_path/learning.dart';
import 'package:qaribu/root_layout/cubit/root_layout_cubit.dart';

class RouteGenerator {
  final RootLayoutCubit rootLayoutCubit = RootLayoutCubit();
  Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: rootLayoutCubit,
            child: const HomePage(),
          ),
          settings: settings,
        );
      case '/culture':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: rootLayoutCubit,
            child: const CulturePage(),
          ),
          settings: settings,
        );
      case '/expectations':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: rootLayoutCubit,
            child: const ExpectationPage(),
          ),
          settings: settings,
        );
      case '/recommendation':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: rootLayoutCubit,
            child: const LearningPage(),
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: rootLayoutCubit,
            child: const HomePage(),
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
