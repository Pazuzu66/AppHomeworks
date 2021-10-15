import 'package:flutter/material.dart';
import 'package:tareas_app/src/utils/colors_per.dart';

class IconW extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  IconW({ 
    required this.icon, 
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => this.onPressed(), 
      icon: Icon(this.icon),
      color: Colors_Per.cIcon,);
  }
}