import 'package:flutter/material.dart';

class WorkshopsScreen extends StatelessWidget {
  static const routeName = '/workshops';

  const WorkshopsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workshops'),
      ),
      body: Center(
        child: Text('This is the Workshops screen content'),
      ),
    );
  }
}