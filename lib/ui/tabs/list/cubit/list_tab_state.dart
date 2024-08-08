import 'package:task_auvnet/constant/failures.dart';
import 'package:task_auvnet/domain/entity/cart_entity.dart';
import 'package:task_auvnet/domain/entity/product_response.dart';

abstract class ListTabState {}

class ListTabProductInitialState extends ListTabState {}

class ListTabProductLoadingState extends ListTabState {
  String? loadingMessage;
  ListTabProductLoadingState({required this.loadingMessage});
}

class ListTabProductErrorState extends ListTabState {
  Failures error;
  ListTabProductErrorState({required this.error});
}

class ListTabProductSuccessState extends ListTabState {
  ProductResponseEntity productResponseEntity;
  ListTabProductSuccessState({required this.productResponseEntity});
}

class AddToCartLoadingState extends ListTabState {
  String? loadingMessage;
  AddToCartLoadingState({required this.loadingMessage});
}

class AddToCartErrorState extends ListTabState {
  Failures error;
  AddToCartErrorState({required this.error});
}

class AddToCartSuccessState extends ListTabState {
  CartResponseEntity cartResponseEntity;
  AddToCartSuccessState({required this.cartResponseEntity});
}
