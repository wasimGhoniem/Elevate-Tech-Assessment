import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:elevate_tech_assessment/core/api/api_manager.dart';
import 'package:elevate_tech_assessment/core/api/end_points.dart';
import 'package:elevate_tech_assessment/core/errors/failures.dart';
import 'package:elevate_tech_assessment/core/utils/app_constants.dart';
import 'package:elevate_tech_assessment/data/model/ProductResponseDm.dart';
import 'package:elevate_tech_assessment/domain/repositories/data_sources/remote_data_source/product_remote_data_source.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:ProductRemoteDataSource )
class ProductRemoteDataSourceImp implements ProductRemoteDataSource {
  ApiManager apiManager;
  ProductRemoteDataSourceImp({required this.apiManager});
  @override
  Future<Either<Failures, ProductResponseDm>> getProduct() async{

    var connectivityResult= await Connectivity().checkConnectivity();
    if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)){

      var response=await  apiManager.getData(endPoint: EndPoints.productApi);
      var productResponse=ProductResponseDm.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<300){
        return right(productResponse);
      }else{
        // var productErrorMsg=ProductResponseDm.fromHttpResponse(response.data).message??'';
        return left(ServerError(errorMsg: productResponse.message!));
      }
      
    }else{
      return left(NetworkError(errorMsg: AppConstants.noInternet,));
    }

 

  }
}