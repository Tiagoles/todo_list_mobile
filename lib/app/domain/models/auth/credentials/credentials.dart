import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smaservicos/app/domain/entities/auth/user/user.dart';
import 'package:smaservicos/app/utils/constants.dart';

part 'credentials.g.dart';

@JsonSerializable(includeIfNull: false)
class Credentials{

  String usuario;
  String nome;
  String? senha;
  double empresa;
  int userTypeCode;

  Credentials({
    this.usuario = '',
    this.nome = '',
    this.senha,
    this.empresa = Constants.empresa,
    this.userTypeCode = Constants.userTypeCode,
  });

  factory Credentials.formCredentials(){
    return Credentials(senha: '');
  }

  factory Credentials.fromUser(User user){
    return Credentials(usuario: user.usuario, senha: '');
  }

  Map<String, dynamic> toEletricistaJson(){

    return {
      'DsSenha': senha,
      'CdEletricista': double.tryParse(usuario)
    };

  }

  Map<String, dynamic> toEquipeJson(){

    return {
      'DsSenha': senha,
      'CdEquipe': double.tryParse(usuario)
    };

  }

  Map<String, dynamic> toUserJson(){

    return {
      'CdEmpresa': empresa,
      'DsSenha': senha,
      'CdUsuario': usuario,
    };

  }

  factory Credentials.fromJson(Map<String, dynamic> json) => _$CredentialsFromJson(json);
  Map<String, dynamic> toJson() => _$CredentialsToJson(this);

}