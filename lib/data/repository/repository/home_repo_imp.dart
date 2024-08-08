import 'package:dartz/dartz.dart';
import 'package:task_auvnet/constant/failures.dart';
import 'package:task_auvnet/domain/entity/cart_entity.dart';
import 'package:task_auvnet/domain/entity/product_response.dart';
import 'package:task_auvnet/domain/repository/data_source/home_remote_data_source.dart';
import 'package:task_auvnet/domain/repository/repository/home_repository_contract.dart';

class HomeRepositoryImpl implements HomeRepositoryContract {
  HomeDataSource dataSource;
  HomeRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() {
    return dataSource.getProducts();
  }

  @override
  Future<Either<Failures, CartResponseEntity>> addToCart(String productId) {
    return dataSource.addToCart(productId);
  }
}
