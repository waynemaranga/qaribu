import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaribu/culture_page/culture.dart';
import 'package:qaribu/expectation/expectation.dart';
import 'package:qaribu/home/home.dart';
import 'package:qaribu/learning_path/learning.dart';
import 'package:qaribu/root_layout/cubit/root_layout_cubit.dart';

@immutable
class RootLayout extends StatelessWidget {
  RootLayout({super.key});

  final List<String> titles = const <String>[
    'Home',
    'Culture',
    'Expectations',
    'Learning path',
  ];

  final List<BottomNavigationBarItem> bottomNavItems =
      const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people),
      label: 'Culture',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.task),
      label: 'Expectations',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.library_books),
      label: 'Learning path',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  final List<Widget> pages = <Widget>[
    const HomePage(),
    const CulturePage(),
    const ExpectationPage(),
    const LearningPage(),
    // ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RootLayoutCubit, RootLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(titles[state.pageIndex]),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: pages[state.pageIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.pageIndex,
            type: BottomNavigationBarType.fixed,
            items: bottomNavItems,
            onTap: (index) {
              context.read<RootLayoutCubit>().changePage(index);
            },
          ),
        );
      },
    );
  }
}
