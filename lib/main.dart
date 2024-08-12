import 'package:flutter/material.dart';
import 'front_page.dart';
import 'questions_page.dart';
import 'habits_page.dart';
import 'tracker_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FrontPage(),
      routes: {
        '/questions': (context) => QuestionsPage(),
        '/habits': (context) => HabitsPage(),
        '/tracker': (context) => TrackerPage(),
      },
    );
  }
}
