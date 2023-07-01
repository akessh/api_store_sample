
import 'package:get/get.dart';
import 'package:sample_store_api/services/store_services.dart';

class StoreController extends GetxController {
  var title =RxString('');
  var description=RxString('');
  var price=RxDouble(0);
  var image=RxString('');
 
  

  getData() async {
    try {
      var storeData = await StoreServices().getServices();

      if (storeData != null) {
        
        title.value = storeData.title??'';
        description.value=storeData.description??'';
        price.value=double.parse(storeData.price??'0');
        image.value=storeData.image??'';
        
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
      print(e);
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}