import 'dart:convert';

import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/services/core/local_storage/local_storage.dart';
import 'package:smaservicos/app/domain/entities/auth/user/user.dart';

const _key = 'user';

class AuthLocalStorage {

  final LocalStorage _localStorage;

  AuthLocalStorage(this._localStorage);

  AsyncResult<User> saveUser(User user) async {
    return _localStorage.write(key: _key, value: jsonEncode(user.toJson()))
        .map((value) => User.fromJson(jsonDecode(value)));
  }

  AsyncResult<User> getUser() async {
    final result = await _localStorage.read(key: _key)
        .map((value) => User.fromJson(jsonDecode(value)));
    return result;
  }

  AsyncResult<String> removeUser() async {
    return _localStorage.delete(key: _key);
  }

}