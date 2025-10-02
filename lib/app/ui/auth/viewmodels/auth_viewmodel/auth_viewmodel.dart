import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/auth/auth_repository.dart';
import 'package:smaservicos/app/domain/entities/auth/user/user.dart';

part 'auth_viewmodel.g.dart';

class AuthViewModel = AuthViewModelBase with _$AuthViewModel;

abstract class AuthViewModelBase with Store implements Disposable {

  final AuthRepository _repository;
  late final StreamSubscription<User> _userObserver;

  AuthViewModelBase(this._repository){
    _userObserver = _repository.userObserver.listen((user){
      this.user = user;
    });
  }

  @observable
  User user = const NotLoggedUser();

  @override
  void dispose() async {
    await _userObserver.cancel();
  }

  @computed
  bool get isLogged => user.isLogged;

  @computed
  bool get isAdmin => isLogged && ['sm', 'agatti', 'amodenesi'].contains(user.usuario.toLowerCase());

  @computed
  bool get isSessionExpired => _repository.isTokenExpired();

  @action
  AsyncResult<String> logout(Map? args) async {
    return _repository.removeUser()
        .onSuccess((_) => Modular.to.navigate('/auth/login', arguments: args));
  }

}