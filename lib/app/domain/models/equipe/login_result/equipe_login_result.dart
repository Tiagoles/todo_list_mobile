import 'package:json_annotation/json_annotation.dart';
import 'package:smaservicos/app/domain/entities/auth/user/user.dart';

part 'equipe_login_result.g.dart';

@JsonSerializable(includeIfNull: false)
class EquipeLoginResult{

  final double equipe;
  final String nome;
  final double empresa;
  String token;

  EquipeLoginResult({
    required this.equipe,
    required this.nome,
    required this.empresa,
    required this.token,
  });

  factory EquipeLoginResult.fromJson(Map<String, dynamic> json) => _$EquipeLoginResultFromJson(json);
  Map<String, dynamic> toJson() => _$EquipeLoginResultToJson(this);

  LoggedEquipe toUser() => LoggedEquipe(
    usuario: equipe.toString(),
    nmUsuario: nome,
    empresa: empresa,
    token: token
  );

}