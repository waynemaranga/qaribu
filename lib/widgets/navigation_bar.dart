import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Culture'),
        BottomNavigationBarItem(
            icon: Icon(Icons.task), 
            label: 'Expectations'),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_books), 
            label: 'Learning path'),
      ],
    );
  }
}
