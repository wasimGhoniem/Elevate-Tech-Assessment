import 'package:elevate_tech_assessment/core/errors/failures.dart';
import 'package:elevate_tech_assessment/domain/entities/ProductResponseEntity.dart';

abstract class ProductStates {}

class ProductLoadingState extends ProductStates {}
class ProductSuccessState extends ProductStates {
  final List<ProductResponseEntity> products;
  ProductSuccessState({required this.products});
}


class ProductErrorState extends ProductStates {
 final Failures failures;
  ProductErrorState({required this.failures});

}