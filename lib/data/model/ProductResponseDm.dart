import 'dart:convert';

import '../../domain/entities/ProductResponseEntity.dart';

class ProductResponseDm extends ProductResponseEntity {
  ProductResponseDm({
    super.id,
    super.title,
    super.price,
    super.description,
    super.category,
    super.image,
    super.rating,
    this.message,
    this.statusMsg,
  });

  String? message;
  String? statusMsg;


  ProductResponseDm.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? ProductRatingDm.fromJson(json['rating']) : null;
    message = json['message'];
    statusMsg = json['statusMsg'];
  }


  factory ProductResponseDm.fromResponse(dynamic response) {
    if (response is Map<String, dynamic>) {
      return ProductResponseDm(
        id: response['id'],
        title: response['title'],
        price: response['price'],
        description: response['description'],
        category: response['category'],
        image: response['image'],
        rating: response['rating'] != null ? ProductRatingDm.fromJson(response['rating']) : null,
        message: response['message'],
        statusMsg: response['statusMsg'],
      );
    }
    if (response is String && response.contains('<html')) {
      final errorMsg = _extractHtmlErrorMessage(response);
      return ProductResponseDm(
        message: errorMsg ?? 'Unknown server error',
        statusMsg: 'fail',
      );
    }
    return ProductResponseDm(
      message: 'Unknown response format',
      statusMsg: 'fail',
    );
  }


  static ProductResponseDm fromHttpResponse(dynamic httpResponse) {
    try {
      if (httpResponse is Map<String, dynamic>) {
        return ProductResponseDm.fromResponse(httpResponse);
      }
      if (httpResponse is String) {
        try {
          final decoded = jsonDecode(httpResponse);
          return ProductResponseDm.fromResponse(decoded);
        } catch (e) {
          return ProductResponseDm.fromResponse(httpResponse);
        }
      }
      return ProductResponseDm(
        message: 'Unknown response type',
        statusMsg: 'fail',
      );
    } catch (e) {
      return ProductResponseDm(
        message: 'Error parsing response: $e',
        statusMsg: 'fail',
      );
    }
  }


  static String? _extractHtmlErrorMessage(String html) {
    final regExp = RegExp(r'<pre>(.*?)<\/pre>', dotAll: true);
    final match = regExp.firstMatch(html);
    return match?.group(1)?.trim();
  }
}

class ProductRatingDm extends ProductRatingEntity {
  ProductRatingDm({
    super.rate,
    super.count,
  });

  ProductRatingDm.fromJson(dynamic json) {
    rate = json['rate'];
    count = json['count'];
  }
}