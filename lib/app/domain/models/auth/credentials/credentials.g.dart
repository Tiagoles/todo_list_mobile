// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credentials _$CredentialsFromJson(Map<String, dynamic> json) => Credentials(
  usuario: json['usuario'] as String? ?? '',
  nome: json['nome'] as String? ?? '',
  senha: json['senha'] as String?,
  empresa: (json['empresa'] as num?)?.toDouble() ?? Constants.empresa,
  userTypeCode:
      (json['userTypeCode'] as num?)?.toInt() ?? Constants.userTypeCode,
);

Map<String, dynamic> _$CredentialsToJson(Credentials instance) =>
    <String, dynamic>{
      'usuario': instance.usuario,
      'nome': instance.nome,
      'senha': ?instance.senha,
      'empresa': instance.empresa,
      'userTypeCode': instance.userTypeCode,
    };
