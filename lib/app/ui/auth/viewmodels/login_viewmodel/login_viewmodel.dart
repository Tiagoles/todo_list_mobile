import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/data/repositories/auth/auth_repository.dart';
import 'package:smaservicos/app/data/repositories/auth/credentials_repository.dart';
import 'package:smaservicos/app/domain/entities/auth/user/user.dart';
import 'package:smaservicos/app/domain/models/auth/credentials/credentials.dart';
import 'package:smaservicos/app/domain/models/auth/forms/login_form.dart';
import 'package:smaservicos/app/utils/command.dart';

class LoginViewModel implements Disposable{
  final AuthRepository _repository;
  final CredentialsRepository _credentialsRepository;
  late final StreamSubscription<Credentials> _credentialsObserver;
  final LoginForm loginForm = LoginForm();
  late final Command1<User, LoginForm> loginCommand;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginViewModel(this._repository, this._credentialsRepository){
    loginCommand = Command1<User, LoginForm>(_repository.login);
    _credentialsObserver = _credentialsRepository.credentialsObserver.listen(_onCredentialsChanged);
  }

  void _onCredentialsChanged(Credentials credentials){
    loginForm.fromModel(credentials);
  }

  @override
  void dispose() {
    _credentialsObserver.cancel();
    loginForm.dispose();
    loginCommand.dispose();
  }

  Future<void> submit() async {
    if(!formKey.currentState!.validate()) return;
    final credentials = loginForm.toModel();
    await loginCommand.execute(loginForm);
    if(loginCommand.completed){
      if(loginForm.control<bool,bool>('remember').value){
        credentials.senha = null;
        await _credentialsRepository.saveCredentials(credentials);
        return;
      }
      await _credentialsRepository.removeCredentials();
    }

  }

}