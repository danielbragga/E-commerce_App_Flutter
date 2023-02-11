import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_devnology/api/api_service.dart';
import 'package:flutter_test_devnology/models/category.dart';
import 'package:flutter_test_devnology/models/pagination.dart';
import 'package:flutter_test_devnology/models/product.dart';
import 'package:flutter_test_devnology/models/product_filter.dart';
import 'package:flutter_test_devnology/widgets/widget_home_products.dart';

import 'models/product.dart';
import 'models/product_filter.dart';

final categoriesProvider =
    FutureProvider.family<List<Category>?, PaginationModel>(
  (ref, paginationModel) {
    final apiRepository = ref.watch(apiService);

    return apiRepository.getCategories(
      paginationModel.page,
      paginationModel.pageSize,
    );
  },
);

final homeProductProvider =
    FutureProvider.family<List<Product>?, ProductFilterModel>(
  (ref, productFilterModel) {
    final apiRespository = ref.watch(apiService);

    return apiRespository.getProducts(productFilterModel);
  },
);
