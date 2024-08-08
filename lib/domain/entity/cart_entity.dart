class CartResponseEntity {
  final String? status;
  final String? message;
  final int? numOfCartItems;
  final AddDataEntity? data;

  CartResponseEntity({
    required this.status,
    required this.message,
    required this.numOfCartItems,
    required this.data,
  });
}

class AddDataEntity {
  final String? id;
  final String? cartOwner;
  final List<AddProductEntity>? products;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? totalCartPrice;

  AddDataEntity({
    required this.id,
    required this.cartOwner,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.totalCartPrice,
  });
}

class AddProductEntity {
  final int? count;
  final String? id;
  final String? product;
  final int? price;

  AddProductEntity({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });
}
