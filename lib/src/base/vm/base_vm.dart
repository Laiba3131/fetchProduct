import 'package:fetch_product/services/api_manager.dart';
import 'package:fetch_product/utils/custom_widgets/toasters.dart';
import 'package:flutter/material.dart';
import '../model/product_model.dart';

class ProductVM extends ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  fetchProducts(context) async {
    ZBotToast.loadingShow();
    notifyListeners();
    _products = await ApiManager.fetchProduct(context);
    ZBotToast.loadingShow();
    notifyListeners();
  }
}
