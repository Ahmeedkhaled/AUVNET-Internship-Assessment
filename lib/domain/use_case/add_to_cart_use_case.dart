import 'package:dartz/dartz.dart';
import 'package:task_auvnet/constant/failures.dart';
import 'package:task_auvnet/domain/entity/cart_entity.dart';
import 'package:task_auvnet/domain/repository/repository/home_repository_contract.dart';

class AddToCartUseCase {
  HomeRepositoryContract repositoryContract;
  AddToCartUseCase({required this.repositoryContract});

  Future<Either<Failures, CartResponseEntity>> invoke(String productId) {
    return repositoryContract.addToCart(productId);
  }
}
