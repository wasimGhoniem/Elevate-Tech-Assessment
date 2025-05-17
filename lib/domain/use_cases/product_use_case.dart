import 'package:dartz/dartz.dart';
import 'package:elevate_tech_assessment/domain/repositories/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';
import '../entities/ProductResponseEntity.dart';
@injectable
class ProductUseCase {

  ProductRepository productRepository;
  ProductUseCase({required this.productRepository});

  Future<Either<Failures, List<ProductResponseEntity>>> invoke(){
       return productRepository.getProduct();
     }



}