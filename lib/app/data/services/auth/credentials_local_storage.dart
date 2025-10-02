import 'dart:convert';

import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/services/core/local_storage/local_storage.dart';
import 'package:smaservicos/app/domain/models/auth/credentials/credentials.dart';

const _key = 'credentials';

class CredentialsLocalStorage {
  final LocalStorage _localStorage;

  CredentialsLocalStorage(this._localStorage);

  AsyncResult<Credentials> getCredentials() {
    return _localStorage.read(key: _key).map(
        (json) => Credentials.fromJson(jsonDecode(json))
    );
  }

  AsyncResult<Credentials> saveCredentials(Credentials credentials) {
    return _localStorage.write(key: _key, value: jsonEncode(credentials.toJson()))
        .pure(credentials);
  }

  AsyncResult<String> removeCredentials() {
    return _localStorage.delete(key: _key);
  }

}