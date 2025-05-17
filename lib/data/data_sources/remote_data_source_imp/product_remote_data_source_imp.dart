import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:elevate_tech_assessment/core/api/api_manager.dart';
import 'package:elevate_tech_assessment/core/api/end_points.dart';
import 'package:elevate_tech_assessment/core/api/status_code.dart';
import 'package:elevate_tech_assessment/core/errors/failures.dart';
import 'package:elevate_tech_assessment/core/utils/app_constants.dart';
import 'package:elevate_tech_assessment/data/model/ProductResponseDm.dart';
import 'package:elevate_tech_assessment/domain/repositories/data_sources/remote_data_source/product_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImp implements ProductRemoteDataSource {
  ApiManager apiManager;

  ProductRemoteDataSourceImp({required this.apiManager});

  @override
  Future<Either<Failures, List<ProductResponseDm>>> getProduct() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(endPoint: EndPoints.productApi);
        var products = (response.data as List)
            .map((item) => ProductResponseDm.fromJson(item))
            .toList();
        if (response.statusCode! >= StatusCode.ok &&
            response.statusCode! < StatusCode.multipleChoices) {
          return right(products);
        } else {
          var errorProduct = ProductResponseDm.fromJson(response.data);
          return left(ServerError(
            errorMsg: errorProduct.message ?? '',
          ));
        }
      } else {
        return left(NetworkError(
          errorMsg: AppConstants.noInternet,
        ));
      }
    } catch (e) {
      return left(ServerError(errorMsg: e.toString()));
    }
  }
}
