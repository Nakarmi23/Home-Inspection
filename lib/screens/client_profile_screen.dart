import 'package:flutter/material.dart';

class ClientProfileScreen extends StatefulWidget {
  ClientProfileScreen({Key key}) : super(key: key);

  @override
  _ClientProfileScreenState createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client Profile'),
      ),
      body: Form(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
