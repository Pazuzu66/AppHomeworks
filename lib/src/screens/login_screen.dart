import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tareas_app/src/screens/homeworkScreens/controller/homework_controller.dart';
import 'package:tareas_app/src/utils/colors_per.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Controllers
  TextEditingController _controllerUser = TextEditingController();
  TextEditingController _controllerPassw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_Per.cBackground,
      body: _Components(),
    );
  }

  Widget _Components() {
    final hwController = Get.put(HomeworkController()); 
    //Llenamos las listas del controller de Homework
    hwController.getLists();
    
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(top: 150, left: 15, right: 15),
      child: ListView(
        children: [
          _LoginImage(),
          SizedBox(
            height: 20,
          ),
          _TxtUser(),
          SizedBox(
            height: 15,
          ),
          _TxtPassw(),
          SizedBox(
            height: 15,
          ),
          _BtnAccess()
        ],
      ),
    );
  }

  Widget _TxtUser() {
    return TextField(
      controller: _controllerUser,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: "Correo"),
      onChanged: (value) {},
    );
  }

  Widget _TxtPassw() {
    return TextField(
      controller: _controllerPassw,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: "Contraseña"),
      onChanged: (value) {},
    );
  }

  Widget _BtnAccess() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors_Per.cButtonPrymary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.login), Text('    Ingresar')],
      ),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/homeworks');
      },
    );
  }

  Widget _LoginImage() {
    return Image.asset(
      'assets/login_tarea.png',
      height: 200,
    );
  }
}
