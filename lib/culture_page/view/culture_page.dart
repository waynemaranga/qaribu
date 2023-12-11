import 'package:flutter/material.dart';

class CulturePage extends StatefulWidget {
  const CulturePage({super.key});


  @override
  State<CulturePage> createState() => _CulturePageState();
}

class _CulturePageState extends State<CulturePage> {
  @override
  Widget build(BuildContext context) {
    return 
        const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('Learn about the company culture here:'),
              ),
            ],
          ),
        


    );
  }
}
