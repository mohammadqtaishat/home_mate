import 'package:flutter/material.dart';

class ProfilesPage extends StatefulWidget {
  @override
  _ProfilesPageState createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('ProfilesPage')
        )
      ),
    );
  }
}
