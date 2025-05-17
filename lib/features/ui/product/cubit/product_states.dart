import 'package:elevate_tech_assessment/core/errors/failures.dart';
import 'package:elevate_tech_assessment/domain/entities/ProductResponseEntity.dart';

abstract class ProductStates {}

class ProductLoadingState extends ProductStates {}
class ProductSuccessState extends ProductStates {
  ProductResponseEntity productResponseEntity;
  ProductSuccessState({required this.productResponseEntity});
}


class ProductErrorState extends ProductStates {
  Failures failures;
  ProductErrorState({required this.failures});

}