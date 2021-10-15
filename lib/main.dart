import 'package:flutter/material.dart';
import 'package:tareas_app/src/screens/homeworkScreens/addHW_screen.dart';
import 'package:tareas_app/src/screens/homeworkScreens/homework_screen.dart';
import 'package:tareas_app/src/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/homeworks' : (BuildContext context) => HomeWorkScreen(),
        '/addhw'      : (BuildContext context) => AddHomework_Scren(),
      },
      debugShowCheckedModeBanner: false, home: SplashScreen(),
    );
  }
}
