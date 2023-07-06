

import 'package:get/get.dart';
import 'package:sample_store_api/model/product/product.dart';
import 'package:sample_store_api/services/store_services.dart';

class StoreController extends GetxController {
  // var title =Rx<String>('');
  // var description=Rx<String>('');
  // var price=Rx<double>(0);
  // var image=Rx<String>('');
  var productList=<Product>[].obs;
  var isLoading=true.obs;
  // var category=Rx<String>('');
  // var id=Rx<int>(0);
 
  

  getData() async {
    try {
      isLoading.value=true;
      var products = await StoreServices().getServices();

      if ( products!= null && products.isNotEmpty) {
       productList.value=products;
        // id.value=productList.id??'0' as int;
        // title.value = productList.title??'';
        // description.value=productList.description??'';
        // price.value=productList.price??'0'as double;
        // image.value=productList.image??'';
        // category.value=productList.category ?? '';
        isLoading.value=false;
       
        
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
     isLoading.value=false;
    //  print(e);
    }
    
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
  
}