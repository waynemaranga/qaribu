import 'package:flutter/material.dart';
import 'package:qaribu/pages/culture_page.dart';
import 'package:qaribu/pages/expectation_page.dart';
import 'package:qaribu/pages/homepage.dart';
import 'package:qaribu/pages/recommendation_page.dart';
import 'package:qaribu/pages/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qaribu',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/sign_in',
      routes: {
        '/home': (context) => const HomePage(),
        '/recommendation': (context) => const RecommendationPage(),
        '/sign_in': (context) => const SignInPage(),
        '/culture':(context) => const CulturePage(),
        '/expectations':(context) => const ExpectationPage(),
      },
    );
  }
}
