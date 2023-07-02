
import 'package:get/get.dart';
import 'package:sample_store_api/services/store_services.dart';

class StoreController extends GetxController {
  var title =RxString('');
  var description=RxString('');
  var price=RxDouble(0);
  var image=RxString('');
  var isLoading=true.obs;
 
  

  getData() async {
    try {
      isLoading.value=true;
      var storeData = await StoreServices().getServices();

      if (storeData != null) {
        
        title.value = storeData.title??'';
        description.value=storeData.description??'';
        price.value=double.parse(storeData.price??'0');
        image.value=storeData.image??'';
        isLoading.value=false;
        
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
     isLoading.value=false;
     print(e);
    }
    
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
  
}