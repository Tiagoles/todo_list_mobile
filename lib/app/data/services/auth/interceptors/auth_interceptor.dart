import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/services/auth/auth_local_storage.dart';
import 'package:smaservicos/app/domain/entities/auth/user/user.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final AuthLocalStorage authLocalStorage;

  AuthInterceptor({
    required this.dio,
    required this.authLocalStorage,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _getToken();
    if (token != null) {
      options.headers.addAll({
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final token = await _getToken();
      if(token == null) return;
      _handleLogout('Sua sessão expirou ou suas credenciais são inválidas. Faça o login novamente!');
    }

    handler.next(err);
  }

  Future<String?> _getToken() async {
    final user = await authLocalStorage.getUser().getOrNull();
    if(user != null && user is! NotLoggedUser) return user.token;
    return null;
  }

  void _handleLogout(String error) {
    Modular.to.navigate('/auth/logout', arguments: {'error': error});
  }
}
