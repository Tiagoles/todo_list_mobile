import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import 'package:result_dart/result_dart.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:smaservicos/app/data/repositories/eletricista/eletricista_repository.dart';
import 'package:smaservicos/app/data/services/auth/auth_local_storage.dart';
import 'package:smaservicos/app/data/services/auth/authenticator.dart';
import 'package:smaservicos/app/domain/entities/auth/user/user.dart';
import 'package:smaservicos/app/domain/models/auth/forms/login_form.dart';

import '../../../domain/enums/auth/user_type.dart';

class AuthRepository implements Disposable {
  final AuthLocalStorage _localStorage;
  final Authenticator _sismAuthenticator;
  final EletricistaRepository _eletricistaRepository;
  final _subject = BehaviorSubject<User>.seeded(const NotLoggedUser());

  AuthRepository(this._localStorage, this._sismAuthenticator, this._eletricistaRepository);

  Stream<User> get userObserver => _subject.stream;

  Future<void> init() async {
    await _localStorage
        .getUser()
        .onSuccess(_subject.add)
        .onFailure((f) => _subject.add(const NotLoggedUser()));
  }

  @override
  void dispose() {
    _subject.close();
  }

  AsyncResult<User> login(LoginForm form) async {
    return form.validateResult().map((f) => f.toModel()).flatMap((f){
      if(f.userTypeCode == UserType.eletricista.code){
        return _eletricistaRepository.login(f);
      }
      return _sismAuthenticator.login(f)
          .map((r) => r.toUser());
    }).flatMap(saveUser);
  }

  AsyncResult<User> getUser() {
    return _localStorage.getUser();
  }

  AsyncResult<User> saveUser(User user) {
    return _localStorage
        .saveUser(user)
        .onSuccess(_subject.add)
        .onFailure((f) => _subject.add(const NotLoggedUser()));
  }

  AsyncResult<String> removeUser() {
    return _localStorage.removeUser().onSuccess(
      (_) => _subject.add(const NotLoggedUser()),
    );
  }

  bool isTokenExpired() {

    final user = _subject.value;

    if (!user.isLogged) return true;

    final payload = JwtDecoder.decode(user.token!);
    final int exp = payload['exp'] as int;
    final DateTime expiryDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    return DateTime.now().isAfter(expiryDate);

  }

}
