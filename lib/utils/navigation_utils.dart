import 'package:flutter/material.dart';

class Navigationutils {
  static void onItemTapped(context, int index) {
    // Handle navigation
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/culture');
        break;
      case 2:
        Navigator.pushNamed(context, '/expectations');
        break;
      case 3:
        Navigator.pushNamed(context, '/recommendation');
        break;
      default:
        Navigator.pushNamed(context, '/home');
    }
  }
}
