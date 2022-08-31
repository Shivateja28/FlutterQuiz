import 'package:flutter/material.dart';
import 'components/defaultApp.dart';
import 'components/question.dart';
import 'components/resultApp.dart';

void main() {
  runApp(
    MaterialApp( 
      title: "Assignment",
      routes: {
        '/myapp':(context) => MyApp(),
        '/':((context) => userInfo())
      },
    )
  );
}

