import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/services/core/clients/client_http.dart';
import 'package:smaservicos/app/domain/models/auth/credentials/credentials.dart';
import 'package:smaservicos/app/domain/models/auth/login_result/login_result.dart';

class Authenticator {
  final String url = 'login';
  final ClientHttp _client;

  Authenticator(this._client);

  AsyncResult<LoginResult> login(Credentials credentials) async {
    final result = await _client.post(url, credentials.toUserJson());
    return result.map((resp) => LoginResult.fromJson(resp.data));
  }

}