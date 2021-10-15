import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tareas_app/src/database/database_helper.dart';
import 'package:tareas_app/src/models/homework_model.dart';
import 'package:tareas_app/src/utils/colors_per.dart';

class HomeworkController extends GetxController {
    final name = ''.obs;
    final description = ''.obs;
    final edit = 0.obs;
    final delivered = 0.obs;
    final page = false.obs;
    final pagnum = 0.obs;
    final pageController = PageController().obs;
    var deliverDate = DateTime.now().obs; 
   List<HomeworkModel> listHW = <HomeworkModel>[];
   List<HomeworkModel> listHWDelivered = <HomeworkModel>[];
   List<HomeworkModel> listHWUndeliver = <HomeworkModel>[];
   

   void getLists () async {
     getHwDeliverd();
     getHwUndeliver();      
      //IMPORTANTEEEEEEEEEEEEEE HAAAAAAA
      //ESTE UPDATE SIRVE PARA CUANDO INGRESEMOS O OBTENGAMOS
      //UNA NUEVA ACCION DE ACTUALIZAR NUESTRA LISTA DE TAREAS  
      
   }

    getHwDeliverd() async {
      var _databaseHW = DatabaseHelper();
      listHWDelivered = await _databaseHW.getHommeworkDelivered();        
      update();
    }

    getHwUndeliver() async {
      var _databaseHW = DatabaseHelper();
      listHWUndeliver = await _databaseHW.getHommeworkUndeliver();        
      update();
    }

   insertHW(String name, String description, DateTime deliverDate, BuildContext context) async {
     if(name!= null && description != null && deliverDate != null && name!= '' && description != '' && deliverDate != '') {
      var _databaseHelper = DatabaseHelper();
      HomeworkModel newHomework = HomeworkModel(
      nameHW: name,
      descriptionHW: description,
      deliverDate: deliverDate,
      delivered: 0
      );
      await _databaseHelper.insert(newHomework.toMap());
      getLists();           
      Navigator.pop(context);  
     }    
     else {
       showToast('Debe llenar todos los campos', Colors_Per.cButtonDanger, Colors_Per.cTextBButton);       
     }
    

  }
  updateHW(int id,String name, String description, DateTime deliverDate,int delivered, BuildContext context) async {
    if(name!= null && description != null && deliverDate != null && name!= '' && description != '' && deliverDate != '') {
      var _databaseHelper = DatabaseHelper();
      HomeworkModel newHomework = HomeworkModel(
        idHW: id,
        nameHW: name,
        descriptionHW: description,
        deliverDate: deliverDate,
        delivered: delivered 
      );
      
      await _databaseHelper.update(newHomework.toMap());
      getLists();
      update();
      clearController();
      Navigator.pop(context);  
    }
    else {
      showToast('Debe llenar todos los campos', Colors_Per.cButtonDanger, Colors_Per.cTextBButton);
    }
    

  }

  changeDelivered(int id, int flag) async {    
    var _dataseHW = DatabaseHelper();
    await _dataseHW.updateDeliver(id, flag);
    getLists();
    update();    
  }

  deleteHW(int id) async {    
    var _databaseHelper = DatabaseHelper();    
    await _databaseHelper.delete(id);
    getLists(); 
    update();    
  }

  showToast(String msg, Color backColor, Color textColor) {            
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: backColor,
        textColor: textColor,
        fontSize: 16.0,
    );
  }

  clearController() {
    name.value = '';
    description.value = '';
    deliverDate.value = DateTime.now();
    edit.value = 0;
  }

  change() {
    page.value = ! page.value; 
    page.value ?   pagnum.value = 1 : pagnum.value = 0;    
    print('me cagué');
  }
      
}