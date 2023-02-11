import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_devnology/components/product_card.dart';
import 'package:flutter_test_devnology/models/pagination.dart';
import 'package:flutter_test_devnology/models/product_filter.dart';
import 'package:flutter_test_devnology/providers.dart';

import '../models/category.dart';
import '../models/product.dart';

class HomeProductsWidget extends ConsumerWidget {
  const HomeProductsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> list = List<Product>.empty(growable: true);

    list.add(Product(
        productName: "Test Product",
        category: Category(
            categoryName: "Fantastic",
            categoryImage:
                "/uploads/categories/1675534194586-1675302715683-icons8-rocket-48.png",
            categoryId: "63de9f72951e4302c4b1add7"),
        productShortDescription: "test short desc",
        productPrice: 250,
        productSalePrice: 123,
        productImage: "/uploads/products/1676054208277-test.jpeg",
        productSKU: "IN",
        productType: "simple",
        stockStatus: "IN",
        productId: "63e68ec02027c9ea8b4fc1cb"));
    return Container(
      color: const Color(0xffF4F7FA),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top 10 Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: _productsList(ref),
          )
        ],
      ),
    );
  }

  Widget _productsList(WidgetRef ref) {
    final products = ref.watch(
      homeProductProvider(
        ProductFilterModel(
          paginationModel: PaginationModel(page: 1, pageSize: 10),
        ),
      ),
    );
    return products.when(
      data: (list) {
        return _buildProductList(list!);
      },
      error: (_, __) {
        return const Center(child: Text("ERR"));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildProductList(List<Product> products) {
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          var data = products[index];
          return GestureDetector(
            onTap: () {},
            child: ProductCard(model: data),
          );
        },
      ),
    );
  }
}
