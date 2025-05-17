import 'package:elevate_tech_assessment/domain/entities/ProductResponseEntity.dart';

class ProductResponseDm extends ProductResponseEntity {
  String? message;
  String? status;

  ProductResponseDm({
    super.id,
    super.title,
    super.price,
    super.description,
    super.category,
    super.image,
    super.rating,
    this.message,
    this.status,
  });

  factory ProductResponseDm.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return ProductResponseDm(
        id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()),
        title: json['title'],
        price: json['price'] is num ? json['price'] : num.tryParse(json['price'].toString()),
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: json['rating'] != null ? ProductRatingDm.fromJson(json['rating']) : null,
      );
    } else {
      return ProductResponseDm(
        message: "Invalid response format",
        status: "error",
      );
    }
  }
}

class ProductRatingDm extends ProductRatingEntity{
  ProductRatingDm({
      super.rate,
      super.count,});

  ProductRatingDm.fromJson(dynamic json) {
    rate = json['rate'] is num ? json['rate'] : num.tryParse(json['rate'].toString());
    count = json['count'] is num ? json['count'] : num.tryParse(json['count'].toString());
  }




}