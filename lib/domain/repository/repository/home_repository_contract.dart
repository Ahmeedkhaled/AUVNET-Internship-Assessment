import 'package:dartz/dartz.dart';
import 'package:task_auvnet/constant/failures.dart';
import 'package:task_auvnet/domain/entity/cart_entity.dart';
import 'package:task_auvnet/domain/entity/product_response.dart';

abstract class HomeRepositoryContract {
  Future<Either<Failures, ProductResponseEntity>> getProducts();
  Future<Either<Failures, CartResponseEntity>> addToCart(String productId);
}
