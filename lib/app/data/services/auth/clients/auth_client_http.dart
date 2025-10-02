import 'package:smaservicos/app/data/services/auth/auth_local_storage.dart';
import 'package:smaservicos/app/data/services/auth/interceptors/auth_interceptor.dart';
import 'package:smaservicos/app/data/services/core/clients/client_http.dart';

class AuthClientHttp extends ClientHttp {
  AuthClientHttp({
    required super.dio,
    required super.env,
    required AuthLocalStorage localStorage,
  }) : super(interceptor: AuthInterceptor(dio: dio, authLocalStorage: localStorage));
}