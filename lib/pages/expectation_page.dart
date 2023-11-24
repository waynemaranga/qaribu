import 'package:flutter/material.dart';
import 'package:qaribu/utils/navigation_utils.dart';
import 'package:qaribu/widgets/navigation_bar.dart';

class ExpectationPage extends StatefulWidget {
  const ExpectationPage({super.key});

  @override
  State<ExpectationPage> createState() => _ExpectationPageState();
}

class _ExpectationPageState extends State<ExpectationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expectations'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Expectations'),
      ),
      bottomNavigationBar: CustomNavigationBar(currentIndex: 2, onTap: (index) {
        Navigationutils.onItemTapped(context, index);
      })
    );
  }
}