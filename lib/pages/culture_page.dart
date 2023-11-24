import 'package:flutter/material.dart';
import 'package:qaribu/utils/navigation_utils.dart';
import 'package:qaribu/widgets/navigation_bar.dart';

class CulturePage extends StatefulWidget {
  const CulturePage({super.key});

  @override
  State<CulturePage> createState() => _CulturePageState();
}

class _CulturePageState extends State<CulturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Company Culture'),
        automaticallyImplyLeading: false,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Learn about the company culture here:'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(currentIndex: 1, onTap: (index) {
        Navigationutils.onItemTapped(context, index);
      }),
    );
  }
}
