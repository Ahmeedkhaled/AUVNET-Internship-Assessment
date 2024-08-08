import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_auvnet/domain/entity/product_response.dart';
import 'package:task_auvnet/domain/use_case/add_to_cart_use_case.dart';
import 'package:task_auvnet/domain/use_case/get_all_product_use_case.dart';
import 'package:task_auvnet/ui/tabs/list/cubit/list_tab_state.dart';

class ListTabViewModal extends Cubit<ListTabState> {
  final GetAllProductUseCase getAllProductUseCase;
  final AddToCartUseCase addToCartUseCase;

  List<ProductEntity> productsList = [];
  int numOfCartItems = 0;

  ListTabViewModal({
    required this.getAllProductUseCase,
    required this.addToCartUseCase,
  }) : super(ListTabProductInitialState());

  static ListTabViewModal get(context) =>
      BlocProvider.of<ListTabViewModal>(context);

  void getAllProduct() async {
    emit(ListTabProductLoadingState(loadingMessage: "Loading..."));
    var either = await getAllProductUseCase.invoke();
    either.fold(
      (failure) => emit(ListTabProductErrorState(error: failure)),
      (response) {
        productsList = response.data ?? [];
        emit(ListTabProductSuccessState(productResponseEntity: response));
      },
    );
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState(loadingMessage: "Adding to cart..."));
    var either = await addToCartUseCase.invoke(productId);
    either.fold(
      (failure) => emit(AddToCartErrorState(error: failure)),
      (response) {
        numOfCartItems = response.numOfCartItems ?? 0;
        emit(AddToCartSuccessState(cartResponseEntity: response));
      },
    );
  }
}
