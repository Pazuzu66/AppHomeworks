import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tareas_app/src/screens/homeworkScreens/controller/homework_controller.dart';
import 'package:tareas_app/src/screens/homeworkScreens/widgets/homework_W.dart';
import 'package:tareas_app/src/screens/homeworkScreens/widgets/icon_W.dart';
import 'package:tareas_app/src/utils/colors_per.dart';

class HomeWorkScreen extends StatelessWidget {    
  final hwcontroller = Get.find<HomeworkController>();
  @override
  Widget build(BuildContext context) {
                  
    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors_Per.cAppBar,
            title: Text('Tareas'),
            actions: [
              IconW(icon: Icons.add_task_outlined,onPressed:() => _agregar(context))
            ],
          ),
          body: PageView(                  
            onPageChanged: (hwcontroller.pagnum),
            children:[
              HomeworkW(checked: 0),
              HomeworkW(checked: 1)
            ], 
          ),
          bottomNavigationBar: BottomNavigationBar(                                   
            currentIndex: hwcontroller.pagnum.value,              
            items:         
            [                
              BottomNavigationBarItem(
            icon: Icon(Icons.access_alarms_outlined),
            label: 'Pendiente'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in_rounded),
            label: 'Finalizado'
          ),
        ],
      ),
    )
    );
  }
  _agregar(BuildContext context) {
    Navigator.pushNamed(context, '/addhw');
  }
  

}