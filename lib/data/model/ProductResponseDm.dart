import 'package:elevate_tech_assessment/domain/entities/ProductResponseEntity.dart';

class ProductResponseDm extends ProductResponseEntity {
  ProductResponseDm({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    required super.rating,
  });

  factory ProductResponseDm.fromJson(dynamic json) {
    return ProductResponseDm(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      title: json['title'] ?? '',
      price: json['price'] is num ? json['price'] : num.tryParse(json['price']?.toString() ?? '0') ?? 0,
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      image: json['image'] ?? '',
      rating: json['rating'] != null
          ? ProductRatingDm.fromJson(json['rating'])
          : ProductRatingDm(rate: 0, count: 0),
    );
  }
}

class ProductRatingDm extends ProductRatingEntity {
  ProductRatingDm({
    required super.rate,
    required super.count,
  });

  factory ProductRatingDm.fromJson(dynamic json) {
    return ProductRatingDm(
      rate: json['rate'] is num ? json['rate'] : num.tryParse(json['rate']?.toString() ?? '0') ?? 0,
      count: json['count'] is num ? json['count'] : num.tryParse(json['count']?.toString() ?? '0') ?? 0,
    );
  }
}
