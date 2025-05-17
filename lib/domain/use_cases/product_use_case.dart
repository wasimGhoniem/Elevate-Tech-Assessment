import 'package:dartz/dartz.dart';
import 'package:elevate_tech_assessment/domain/repositories/repositories/product_repository.dart';

import '../../core/errors/failures.dart';
import '../entities/ProductResponseEntity.dart';

class ProductUseCase {

  ProductRepository productRepository;
  ProductUseCase({required this.productRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke(){
       return productRepository.getProduct();
     }



}