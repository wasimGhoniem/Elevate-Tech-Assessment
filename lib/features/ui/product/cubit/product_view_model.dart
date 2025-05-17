import 'package:elevate_tech_assessment/domain/use_cases/product_use_case.dart';
import 'package:elevate_tech_assessment/features/ui/product/cubit/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductViewModel extends Cubit<ProductStates> {
  ProductUseCase productUseCase;

  ProductViewModel({required this.productUseCase})
      : super(ProductLoadingState());

  void getProducts() async {
    emit(ProductLoadingState());
    var either = await productUseCase.invoke();
    either.fold((error) {
      emit(ProductErrorState(failures: error));
    }, (response) {
      emit(ProductSuccessState(products: response));
    });
  }
}
