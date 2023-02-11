import 'package:flutter/material.dart';
import 'package:flutter_test_devnology/components/product_card.dart';
import 'package:flutter_test_devnology/models/category.dart';
import 'package:flutter_test_devnology/models/product.dart';
import 'package:flutter_test_devnology/widgets/widget_home_categories.dart';
import 'package:flutter_test_devnology/widgets/widget_home_products.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            const HomeCategoriesWidget(),
            const HomeProductsWidget()
            // ProductCard(
            //    model: model,
            // )
          ],
        ),
      ),
    );
  }
}
