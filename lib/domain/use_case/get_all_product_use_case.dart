import 'package:dartz/dartz.dart';
import 'package:task_auvnet/constant/failures.dart';
import 'package:task_auvnet/domain/entity/product_response.dart';
import 'package:task_auvnet/domain/repository/repository/home_repository_contract.dart';

class GetAllProductUseCase {
  HomeRepositoryContract repositoryContract;
  GetAllProductUseCase({required this.repositoryContract});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return repositoryContract.getProducts();
  }
}
