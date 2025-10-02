import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:result_dart/result_dart.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smaservicos/app/data/services/auth/credentials_local_storage.dart';
import 'package:smaservicos/app/domain/models/auth/credentials/credentials.dart';

class CredentialsRepository implements Disposable {

  final CredentialsLocalStorage _localStorage;
  final BehaviorSubject<Credentials> _subject = BehaviorSubject<Credentials>.seeded(Credentials());

  CredentialsRepository(this._localStorage);

  Stream<Credentials> get credentialsObserver => _subject.stream;

  Future<void> init() async {
    getCredentials().onSuccess(_subject.add);
  }

  @override
  void dispose() {
    _subject.close();
  }

  AsyncResult<Credentials> getCredentials() async {
    return _localStorage.getCredentials();
  }

  AsyncResult<Credentials> saveCredentials(Credentials credentials) async {
    return _localStorage.saveCredentials(credentials)
        .onSuccess(_subject.add)
        .onFailure((f) => _subject.add(Credentials()));
  }

  AsyncResult<String> removeCredentials() async {
    return _localStorage.removeCredentials()
        .onSuccess((_) => _subject.add(Credentials()));
  }
}