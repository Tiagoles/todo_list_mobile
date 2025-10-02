import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/client_http_exception.dart';
import 'package:smaservicos/env/env.dart';

import 'package:smaservicos/app/data/services/core/clients/dio_client.dart';

class ClientHttp extends DioClient{

  ClientHttp({
    required super.dio,
    required Env env,
    super.interceptor
  }) : super(
    baseUrl: env.apiUrl
  );

  AsyncResult<Response<T>> get<T>(String url, {Object? data,   Map<String, dynamic>? queryParameters,   Options? options,   CancelToken? cancelToken,   void Function(int, int)? onReceiveProgress, }) async {
    try{
      return Success(await dio.get<T>(url, queryParameters: queryParameters, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress));
    } on DioException catch(e){
      return Failure(ClientHttpException.fromDioException(e));
    }
  }

  AsyncResult<Response> post(String url, dynamic data, {Options? options}) async {
    try{
      return Success(await dio.post(url, data: data));
    } on DioException catch(e){
      return Failure(ClientHttpException.fromDioException(e));
    }
  }

  AsyncResult<Response> put(String url, dynamic data) async {
    try{
      return Success(await dio.put(url, data: data));
    } on DioException catch(e){
      return Failure(ClientHttpException.fromDioException(e));
    }
  }

  AsyncResult<Response> delete(String url) async {
    try{
      return Success(await dio.delete(url));
    } on DioException catch(e){
      return Failure(ClientHttpException.fromDioException(e));
    }
  }
}