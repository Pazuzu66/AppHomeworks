import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tareas_app/src/screens/homeworkScreens/controller/homework_controller.dart';
import 'package:tareas_app/src/screens/homeworkScreens/widgets/button_W.dart';
import 'package:tareas_app/src/utils/colors_per.dart';

class HomeworkW extends StatelessWidget {  
  var ftoast = FToast();
  var list;
  final controller = Get.find<HomeworkController>();  
  final bool deliveredFlag = false;
  var now = DateTime.now();
  int checked;
  int flag = 0;
  int flagOnTime = 0;

  HomeworkW({
    required this.checked
  });

  @override
  Widget build(BuildContext context) {       
    return  GetBuilder<HomeworkController>(builder:(_c) => components(checked));
    
  } 

  Widget components(int check) {
    if(check == 0)
    {
      list = controller.listHWUndeliver;
      flag = 1;
    }
    else
    {
      list = controller.listHWDelivered;
      flag = 0;
    }
    return 
    ListView.builder(            
        itemCount: list.length,
        itemBuilder: (context, index ) {                  
          return card(                    
            list[index].idHW!,
            list[index].nameHW!,
            list[index].descriptionHW!,
            list[index].deliverDate!,
            list[index].delivered!,
            index,
            context
          );
        }                                             
    );  
  }

  Widget card(int id,String name, String description, DateTime deliverD, int delivered,int index, BuildContext context) {   
    DateTime.now().difference(deliverD) > const Duration(hours: 23) ? flagOnTime = 0 : flagOnTime = 1;        
      return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(15),
              elevation: 10,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 25, top: 10  ),
                    child: ExpansionTile(
                      //contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [                                
                          Text('$name',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),                                     
                        ],
                      ), 
                      children: [
                        Padding(
                          padding: const EdgeInsets.only( top: 20, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('$description',)
                            ],
                          ),
                        ),
                      ],
                      leading: flag == 0 ? Image.asset('assets/completed.png') : Image.asset('assets/pending.png')
                    ),
                  ),          
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(                    
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          deliverD.toString().substring(0,10),
                          style: TextStyle(color: flagOnTime ==1 ? Colors.green : Colors.red ),),  
                        ButtonW(
                          onPressed:() {                                                        
                            controller.changeDelivered(id, flag);
                            String msg;
                            flag == 1 ? msg = 'Se entregó la Tarea' : msg = 'Se anuló la entrega';
                            controller.showToast(msg, Colors_Per.cButton, Colors_Per.cTextBButton);
                          } , 
                          text: flag == 0 ? 'Anular Entrega' :'Entregar', 
                          color: Colors_Per.cTextButtonPrimary,
                          textColor: Colors_Per.cTextBButton,
                          
                        ),
                       flag== 0 ? nothing() :  ButtonW(
                          onPressed: () => edit(context, index, id),
                          text: 'Editar', 
                          color: Colors_Per.cButtonSecondary,
                          textColor: Colors_Per.cTextBButton,),

                          ButtonW(
                            onPressed: () {
                              controller.deleteHW(id);
                              
                            }, 
                            text: 'Eliminar', 
                            color: Colors_Per.cButtonDanger,
                            textColor: Colors_Per.cTextBButton,)
                      ],  
                    ),
                  ),
                ],
              ),
      );
  } 

  Widget nothing() {
    return Text('');
  }
  edit(BuildContext context, int index, int id) {        
   controller.edit.value = id;
   controller.name.value = list[index].nameHW!;
   controller.description.value = list[index].descriptionHW!;
   controller.deliverDate.value = list[index].deliverDate!;
   controller.delivered.value = list[index].delivered;
   Navigator.pushNamed(context, '/addhw'); 
  }
  
}