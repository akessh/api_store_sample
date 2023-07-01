import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:sample_store_api/model/store_model.dart';

class StoreServices {
  var url = 'https://fakestoreapi.com/products/1';

  Future<StoreModel?> getServices() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data=await json.decode(response.body);
      return StoreModel.fromjson(data);
    } else {
      return null;
    }
  }
}