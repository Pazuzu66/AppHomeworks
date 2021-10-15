import 'package:flutter/material.dart';
import 'package:tareas_app/src/screens/homeworkScreens/widgets/addhomework_W.dart';
import 'package:tareas_app/src/utils/colors_per.dart';

// ignore: camel_case_types
class AddHomework_Scren extends StatelessWidget {
  const AddHomework_Scren({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors_Per.cAppBar,
        title: Text('Agregar Tarea'),
      ),
      body:  AddHomeworkW(),      
    );
  }
}