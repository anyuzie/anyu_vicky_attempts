import 'package:flutter/material.dart';

class GuidesScreen extends StatelessWidget {
  static const routeName = '/guides';

  const GuidesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guides'),
      ),
      body: const Center(
        child: Text('This is the Guides screen content'),
      ),
    );
  }
}