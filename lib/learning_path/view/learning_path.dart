import 'package:flutter/material.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({super.key});

  @override
  State<LearningPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text('Here is your recommended learning path:'),
          ),
        ],
      ),
    );
  }
}
