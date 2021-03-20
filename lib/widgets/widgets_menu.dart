import 'package:flutter/material.dart';

class WidMenuPage extends StatefulWidget {
  @override
  _WidMenuPageState createState() => _WidMenuPageState();
}

class _WidMenuPageState extends State<WidMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Widgets Menu')
        )
      ),
    );
  }
}
