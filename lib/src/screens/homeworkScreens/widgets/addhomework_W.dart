import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tareas_app/src/screens/homeworkScreens/controller/homework_controller.dart';
import 'package:tareas_app/src/utils/colors_per.dart';


class AddHomeworkW extends StatelessWidget {  
  bool flagEditing = false;
  final hwcontroller = Get.find<HomeworkController>();

  @override
  Widget build(BuildContext context) {    
    hwcontroller.edit.value != 0 ? flagEditing = true : hwcontroller.clearController();
    return Obx(() => Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(15),
          elevation: 10,
          child: Column(
            children: [
              components(context),                      
            ]
          )
        ),
    );
  }

  Widget components (BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, top: 25, right: 8),
      child: Column(
        children: [
          labels('Nombre de la Tarea'),
          txtName(),     
          labels('Descripcion de la Tarea'),
          txtDescription(),          
          boxDate(context),
          btnSaveHW(context)         
        ],
      ),
      );
  }

  Widget txtName() {
    return TextFormField(    
      onChanged: ( value ) => hwcontroller.name.value = value,
      initialValue: hwcontroller.name.value,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: flagEditing ? hwcontroller.name.value :'Nombre de la tarea',                
      ),
    );
  }
  Widget txtDescription() {
    return TextFormField(
      onChanged: ( value ) => hwcontroller.description.value = value, 
      initialValue: hwcontroller.description.value,
      maxLines: null,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText:'Descripcion de la tarea',              
      ),
    );
  }
  
  Widget labels(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 15, left: 8),
      child: Row(      
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('$text', ),
        ],
      ),
    );
  }
  Widget boxDate (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          datePicker(context);
          
        } ,
        child: InputDecorator(
          decoration: InputDecoration(labelText: 'Fecha de Entrega', enabled: true),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(hwcontroller.deliverDate.toString().substring(0,10)),
              Icon(Icons.arrow_drop_down, color: Colors_Per.cIcon,)
            ],
          ) ,
        ), 
      ),
    );
  }

  Future<void> datePicker( BuildContext context) async {    
    final DateTime? date = 
    await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(DateTime.now().year), 
      lastDate: DateTime(DateTime.now().year + 5)
    );
    date != null ? hwcontroller.deliverDate.value = date : hwcontroller.deliverDate.value = DateTime.now();    
  }

  Widget btnSaveHW (BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors_Per.cButton), 
        elevation: MaterialStateProperty.all<double>(10.0),
        foregroundColor: MaterialStateProperty.all<Color>(Colors_Per.cTextBButton),
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontWeight: FontWeight.w600)) ),

      onPressed: () {
        flagEditing ? hwcontroller.updateHW(hwcontroller.edit.value, hwcontroller.name.value, hwcontroller.description.value, hwcontroller.deliverDate.value,0, context)
        : hwcontroller.insertHW(hwcontroller.name.value, hwcontroller.description.value, hwcontroller.deliverDate.value, context);
      } , 
      child: Text('Guardar Tarea')
    );
  }

  
}