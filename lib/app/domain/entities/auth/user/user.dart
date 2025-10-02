import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smaservicos/app/utils/constants.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {

  const User._();

  const factory User.notLoggedUser({
    @Default('') String usuario,
    @Default('Usuário') String nmUsuario,
  }) = NotLoggedUser;

  const factory User.loggedUser({
    required String usuario,
    @Default('Usuário') String nmUsuario,
    required String token,
    @Default(Constants.empresa) double empresa
  }) = LoggedUser;

  const factory User.notLoggedEletricista({
    @Default('') String usuario,
    @Default('Usuário') String nmUsuario,
    double? escritorio,
  }) = NotLoggedEletricista;

  const factory User.loggedEletricista({
    required String usuario,
    @Default('Usuário') String nmUsuario,
    required double escritorio,
    required String token,
  }) = LoggedEletricista;

  const factory User.notLoggedEquipe({
    @Default('') String usuario,
    @Default('Usuário') String nmUsuario,
    double? empresa,
  }) = NotLoggedEquipe;

  const factory User.loggedEquipe({
    required String usuario,
    @Default('Usuário') String nmUsuario,
    required double empresa,
    required String token,
  }) = LoggedEquipe;

  bool get isLogged => this is LoggedUser || this is LoggedEletricista || this is LoggedEquipe;

  String? get token {
    if(this is LoggedUser) {
      return (this as LoggedUser).token;
    } if(this is LoggedEletricista) {
      return (this as LoggedEletricista).token;
    } if(this is LoggedEquipe) {
      return (this as LoggedEquipe).token;
    }
    return null;
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}