import 'package:flutter/material.dart';
import 'package:qaribu/utils/navigation_utils.dart';
import 'package:qaribu/widgets/navigation_bar.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendation'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Here is your recommended learning path:'),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CustomNavigationBar(currentIndex: 3, onTap: (index) {
      //   Navigationutils.onItemTapped(context, index);
      // }),
    );
  }
}
