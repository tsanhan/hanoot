import 'package:food4good_app/app/data/datasources/mocked_products.dart';
import 'package:food4good_app/app/data/model/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> fetchProductByCategoryId(int categoryId);
}

class ProductsRepositoryImpl implements ProductsRepository {
  @override
  Future<List<Product>> fetchProductByCategoryId(int categoryId) async {
    var products = <Product>[];

    // mimic network fetch delay
    Future.delayed(Duration(seconds: 2));

    switch(categoryId){
      case 0:
        products.addAll(db["veggies"]);
        break;

      case 1:
        products.addAll(db["milk"]);
        break;

      case 2:
        products.addAll(db["meat"]);
        break;
    }

    return products;
  }
}
