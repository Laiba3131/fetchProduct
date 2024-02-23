import 'dart:convert';
import 'package:fetch_product/src/base/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static fetchProduct(context) async {
    try {
      var url = Uri.parse('https://fakestoreapi.com/products');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var productList = (jsonDecode(response.body) as List)
            .map((item) => ProductModel.fromJson(item))
            .toList();
        return productList;
      } else {
        Get.snackbar('Error', 'Failed to load products');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
