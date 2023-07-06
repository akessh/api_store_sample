import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:sample_store_api/model/product/product.dart';

class StoreServices {
  var url = 'https://fakestoreapi.com/products';

  Future<List<Product>?> getServices() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data=await json.decode(response.body) as List<dynamic>;
      return data.map((item) => Product.fromModel(item as Map<String,dynamic>)).toList();
    } else {
      return null;
    }
  }
}