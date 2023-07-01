import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_store_api/controller/store_controller.dart';

class MainPage extends StatelessWidget {
   MainPage({super.key});

  final StoreController controller=Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Obx(
              ()=> Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 controller.image.value.isNotEmpty?
                 Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(controller.image.value)):Container(
                  height: 300,
                  width: double.infinity,
                  color: 
                  Colors.blueAccent,
                 ),

                 
                  SizedBox(height: 10,),
                      
                  // Title---------
                      
                  Text('${controller.title.value}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            
                  // Discription-----------
            
                  Text(controller.description.value.toString()),
            
                  SizedBox(height: 10,),
            
                  Text('${controller.price.value.toStringAsFixed(2)}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400))
                ],
              ),
            ),
          ),
        ),
        
      ),
    );
  }
}