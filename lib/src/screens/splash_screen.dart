import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:tareas_app/src/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: LoginScreen(),
      imageSrc: 'assets/libro.png',
      imageSize: 200,
      duration: 5000,
      text: 'Bienvenido',      
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(fontSize: 35, fontWeight: FontWeight.normal),
      colors: [
        Colors.white
      ],
    );
  }
}
