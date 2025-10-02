import 'package:json_annotation/json_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:smaservicos/app/domain/entities/auth/user/user.dart';
import 'package:smaservicos/app/utils/extensions/string_to_decimal.dart';

part 'login_result.g.dart';

@JsonSerializable(includeIfNull: false)
class LoginResult{

  final String nmUsuario;
  String token;

  LoginResult({
    this.nmUsuario = 'Usuário',
    required this.token,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) => _$LoginResultFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResultToJson(this);

  User toUser() => LoggedUser(
    token: token,
    usuario: cdUsuario,
    nmUsuario: nmUsuario,
    empresa: cdEmpresa
  );

  Map<String, dynamic> get payload{
    return JwtDecoder.decode(token);
  }

  double get cdEmpresa => (payload['CdEmpresa'] as String).toDecimal() ?? 0;

  String get cdUsuario => payload['CdUsuario'] ?? '';

}