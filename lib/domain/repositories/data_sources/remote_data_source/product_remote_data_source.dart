import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../entities/ProductResponseEntity.dart';

abstract class ProductRemoteDataSource {

  Future<Either<Failures,List<ProductResponseEntity>>> getProduct();
}