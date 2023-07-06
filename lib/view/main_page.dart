import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_store_api/controller/store_controller.dart';
import 'package:sample_store_api/model/product/product.dart';

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
              ()=>controller.isLoading.value?const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator()):GridView.builder(
                  
            shrinkWrap: true,
            itemCount: controller.productList.length,
            scrollDirection: Axis.vertical,
            physics:const ScrollPhysics(),
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.72,
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
        mainAxisSpacing: 1.0,
             ),
               itemBuilder: (ctx,index){
                 final product = controller.productList[index];
           return Container(
            height: 70,width: 40,
            
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [ BoxShadow(
            color: Color.fromARGB(255, 226, 226, 226),
            blurRadius: 20.0,
          ),]
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
               Stack(
                 children:[ Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                   
                  image: DecorationImage(image: NetworkImage(product.image?? ''.toString()))
                  ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(onPressed: (){}, icon:const Icon(Icons.favorite_border,color: Colors.blueGrey,)))
                 ]
               ),
                Text(product.title??''.toString(),overflow: TextOverflow.ellipsis,),
               const SizedBox(height: 10,),
               Text('\u{20B9}${product.price.toString()}',overflow: TextOverflow.ellipsis,)
              ]),
            ),
            );
           
           
           
           
           })
            ),
          ),
        ),
        
      ),
    );
  }
}