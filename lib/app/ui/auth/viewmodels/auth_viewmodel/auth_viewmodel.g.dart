// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthViewModel on AuthViewModelBase, Store {
  Computed<bool>? _$isLoggedComputed;

  @override
  bool get isLogged => (_$isLoggedComputed ??= Computed<bool>(
    () => super.isLogged,
    name: 'AuthViewModelBase.isLogged',
  )).value;
  Computed<bool>? _$isAdminComputed;

  @override
  bool get isAdmin => (_$isAdminComputed ??= Computed<bool>(
    () => super.isAdmin,
    name: 'AuthViewModelBase.isAdmin',
  )).value;
  Computed<bool>? _$isSessionExpiredComputed;

  @override
  bool get isSessionExpired => (_$isSessionExpiredComputed ??= Computed<bool>(
    () => super.isSessionExpired,
    name: 'AuthViewModelBase.isSessionExpired',
  )).value;

  late final _$userAtom = Atom(
    name: 'AuthViewModelBase.user',
    context: context,
  );

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$logoutAsyncAction = AsyncAction(
    'AuthViewModelBase.logout',
    context: context,
  );

  @override
  Future<ResultDart<String, Exception>> logout(Map<dynamic, dynamic>? args) {
    return _$logoutAsyncAction.run(() => super.logout(args));
  }

  @override
  String toString() {
    return '''
user: ${user},
isLogged: ${isLogged},
isAdmin: ${isAdmin},
isSessionExpired: ${isSessionExpired}
    ''';
  }
}
