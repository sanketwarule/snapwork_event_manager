import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapwork_event_manager/events_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue.shade900
      ),
      home: EventsScreen()
    );
  }
}
