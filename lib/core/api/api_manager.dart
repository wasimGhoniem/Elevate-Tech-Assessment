import 'package:dio/dio.dart';
import 'package:elevate_tech_assessment/core/api/api_constants.dart';
import 'package:injectable/injectable.dart';
@singleton
class ApiManager {
  var dio = Dio();

  Future<Response> getData(
      {required String endPoint, Map<String, dynamic>? queryParameters, Options? options}) {
   return dio.get(ApiConstants.baseUrl + endPoint, queryParameters: queryParameters,
       options: Options(validateStatus: (status)=>true)
   );

  }
}
