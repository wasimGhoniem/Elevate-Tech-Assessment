import 'package:dartz/dartz.dart';
import 'package:elevate_tech_assessment/core/errors/failures.dart';
import 'package:elevate_tech_assessment/domain/entities/ProductResponseEntity.dart';

abstract class ProductRepository {

  Future<Either<Failures,ProductResponseEntity>> getProduct();

}