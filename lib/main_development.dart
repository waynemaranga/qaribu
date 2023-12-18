import 'package:flutter/widgets.dart';
import 'package:qaribu/app/app.dart';
import 'package:qaribu/bootstrap.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future <void> main() async {
  final widgetsbinding = WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs= await SharedPreferences.getInstance();
 await  bootstrap(() => const App());
}
