import 'package:dartz/dartz.dart';
import 'package:elevate_tech_assessment/core/errors/failures.dart';
import 'package:elevate_tech_assessment/domain/entities/ProductResponseEntity.dart';
import 'package:elevate_tech_assessment/domain/repositories/data_sources/remote_data_source/product_remote_data_source.dart';
import 'package:elevate_tech_assessment/domain/repositories/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:ProductRepository )
class ProductRepositoryImp implements ProductRepository{
  ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImp({required this.productRemoteDataSource});
  @override
  Future<Either<Failures, List<ProductResponseEntity>>> getProduct()async {
    var either=await productRemoteDataSource.getProduct();
   return either.fold((error)=>left(error),
            (response)=>right(response));
  }
}