import 'package:fetch_product/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../vm/base_vm.dart';

class HomeView extends StatefulWidget {
  static String route = '/HomeView';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductVM>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All products',
          style: AppTextStyles().poppinsMedium(),
        ),
      ),
      body: FutureBuilder(
        future: productProvider.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                final product = productProvider.products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.category),
                  leading: Image.network(product.image),
                  trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
