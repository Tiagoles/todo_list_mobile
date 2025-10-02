import 'package:json_annotation/json_annotation.dart';
import 'package:smaservicos/app/domain/entities/auth/user/user.dart';

part 'eletricista_login_result.g.dart';

@JsonSerializable(includeIfNull: false)
class EletricistaLoginResult{

  final double eletricista;
  final String nome;
  final double escritorio;
  String token;

  EletricistaLoginResult({
    required this.eletricista,
    required this.nome,
    required this.escritorio,
    required this.token,
  });

  factory EletricistaLoginResult.fromJson(Map<String, dynamic> json) => _$EletricistaLoginResultFromJson(json);
  Map<String, dynamic> toJson() => _$EletricistaLoginResultToJson(this);

  LoggedEletricista toUser() => LoggedEletricista(
    usuario: eletricista.toString(),
    nmUsuario: nome,
    escritorio: escritorio,
    token: token
  );

}