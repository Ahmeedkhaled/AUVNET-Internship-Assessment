import 'package:dartz/dartz.dart';
import 'package:task_auvnet/constant/failures.dart';
import 'package:task_auvnet/data/modal/api/api_manager.dart';
import 'package:task_auvnet/domain/entity/cart_entity.dart';
import 'package:task_auvnet/domain/entity/product_response.dart';
import 'package:task_auvnet/domain/repository/data_source/home_remote_data_source.dart';

class HomeDataSourceImpl implements HomeDataSource {
  ApiManager apiManager;
  HomeDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() async {
    var either = await apiManager.getAllProduct();
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failures, CartResponseEntity>> addToCart(
      String productId) async {
    var either = await apiManager.addToCart(productId);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }
}
