import 'package:task_auvnet/domain/entity/cart_entity.dart';

class CartResponseDto extends CartResponseEntity {
  CartResponseDto({
    required super.status,
    required super.message,
    required super.numOfCartItems,
    required super.data,
  });

  factory CartResponseDto.fromJson(Map<String, dynamic> json) {
    return CartResponseDto(
      status: json['status'],
      message: json['message'],
      numOfCartItems: json['numOfCartItems'],
      data: AddDataDto.fromJson(json['data']),
    );
  }
}

class AddDataDto extends AddDataEntity {
  AddDataDto({
    required super.id,
    required super.cartOwner,
    required super.products,
    required super.createdAt,
    required super.updatedAt,
    required super.totalCartPrice,
  });

  factory AddDataDto.fromJson(Map<String, dynamic> json) {
    return AddDataDto(
      id: json['_id'],
      cartOwner: json['cartOwner'],
      products: (json['products'] as List)
          .map((item) => AddProductDto.fromJson(item))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      totalCartPrice: json['totalCartPrice'],
    );
  }
}

class AddProductDto extends AddProductEntity {
  AddProductDto({
    required super.count,
    required super.id,
    required super.product,
    required super.price,
  });

  factory AddProductDto.fromJson(Map<String, dynamic> json) {
    return AddProductDto(
      count: json['count'],
      id: json['_id'],
      product: json['product'],
      price: json['price'],
    );
  }
}
